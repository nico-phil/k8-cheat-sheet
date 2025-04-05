#start minikube
minikube start

#stop minikube
minikube stop

#anable metric server on minikube
mikikube addons enable metrics-server

#deploy reqquired component for metrics. this command create a set of pods, services and roles
#to anable metric server 
kubectl create -f deploy/1.8+/


#cluster performace can be views. this command return the CPU and memory consuption for each node
kubectl top node

#view performace metric of pods. this command return the CPU and memory consuption for each pod
kubectl top pod


#get nodes
kubectl get nodes

#create pod withoud yaml file
kubect run nginx --image='nginx'

#Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)
kubectl run nginx --image=nginx --dry-run=client -o yaml


# create pod
kubectl apply -f pod.yml

#get pod
kubectl get pods

#info about the pod
kubectl describe pod my-app-pod

#filter pod with label
kubect get pod --selector app=App1

#count pod
kubect get pod --selector app=App1 --no-headers | wc -l

#get pods with with multiple labels
kubectl get pods --selector env=prod,bu=finance,tier=frontend

#delete pod
kubectl delete pod my-pod

#generate pod quickly and put it in file, so that you can modify it
kubectl run nginx --image=nginx --dry-run=client -o yaml > nginx-pod.yaml

#see log in the pod
kubectl logs pod-name




#-------- ReplicatSet/ReplicaController ------------------------


#create replicatioSet
kubectl apply -f replicaset-definition.yml

#info about replicat set
kubectl get replicasets

#delete replicaset and underline pod
kubectl delete replicaset myapp-deplicaset

#update replicaset
kubectl replace -f replicaset-definition.yml

#scale replicat set
kubectl scale --replicas=6 -f replicatset-definition.yml


#--------- Deployment-------------------------------------------

#Create a deployment quickly
kubectl create deployment --image=nginx nginx


#Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml

#deploy
kubectl apply -f deployment-defintion.yaml

#create deployment with record
kubectl apply -f deployment-defintion.yaml --record

#get deployments
kubectl get deployments

#update the file with edit
kubectl edit deployment myapp-deployment

#update image, you choose one of them
kubectl apply -f deployment-defintion.yaml
kubectl set image deployment myapp-deployment simple-webapp=nginx:1.9.1

#get rollout status(in simple term, deployemtn status)
kubectl rollout status deployment/myapp-deployment

#get rollout history 
kubectl rollout history deployment/myapp-deployment

#Check the status of each revision individually
kubectl rollout history deployment nginx --revision=1

#We can use the --record flag to save the command used to create/update a deployment against the revision number.
kubectl set image deployment nginx nginx=nginx:1.17 --record

#rollback deployment
kubectl rollout undo deployment/myapp-deployment

#To rollback to specific revision we will use the --to-revision flag.
kubectl rollout undo deployment nginx --to-revision=1

#get all objects
kubectl get all

#get deployments in all namespace
kubectl get deployments -A

#Generate Deployment with 4 Replicas
kubectl create deployment nginx --image=nginx --replicas=4

#You can also scale deployment using the kubectl scale command.
kubectl scale deployment nginx --replicas=4



#-------- Service---------------------------------------------------

#create service
kubectl create -f service-definition.yaml

#get services
kubectl get services

#Create a Service named redis-service of type ClusterIP to expose pod redis on port 6379
kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml





#-------------NAMESPACE-------------------------------------------

#get pod in a the default namespace
kubectl get pods --namespace=dev

#get pod in a specific namespace
kubectl get pods --namespace=dev

#Create pod in the default namespace
kubectl create -f pod-defifnition.yam

#Create pod in the specific namespace
kubectl create -f pod-defifnition.yam --namespace=dev

#You can also move the name space to the pod-definition file, so that you do not have specify it in each command

#Create namespace with yml file
kubectl create -f namespace-dev.yml

#Create namespace in one line
kubectl create namespace dev

#switch namespace
kubectl config set-context $(kubectl config current-context) --namespace=dev

#get pods in all namespace
kubectl get pods --all-namespaces

#You can config the resource Quota for a namespace





#-----------------FORMATING OUTPUT WIHT KUBECTL-----------------------

#Output a JSON formatted API object.
-o json

#Print only the resource name and nothing else.
-o name

#Output in the plain-text format with any additional information.
-o wide

#Output a YAML formatted API object.
-o yaml



 # -----------------IMPERATIVE COMMANDES --------------
 
#POD
#Create an NGINX Pod
kubectl run nginx --image=nginx

#Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)
kubectl run nginx --image=nginx --dry-run=client -o yaml


#Deployment
#Create a deployment
kubectl create deployment --image=nginx nginx

#Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)
kubectl create deployment --image=nginx nginx --dry-run -o yaml

#Generate Deployment with 4 Replicas
kubectl create deployment nginx --image=nginx --replicas=4

#You can also scale deployment using the kubectl scale command.
kubectl scale deployment nginx --replicas=4


#Another way to do this is to save the YAML definition to a file and modify
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml > nginx-deployment.yaml


#Service
#Create a Service named redis-service of type ClusterIP to expose pod redis on port 6379
#(This will automatically use the pod's labels as selectors)
kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yam



#Create a Service named nginx of type NodePort to expose pod nginx's port 80 on port 30080 on the nodes:
kubectl expose pod nginx --port=80 --name nginx-service --type=NodePort --dry-run=client -o yaml

#Or generate the file and modift it
kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run=client -o yaml


#---------------------------------ConfigMap-------------------------------
#create configMap imperative way
kubectl create configmap \
    config-name --from-literal=APP_COLOR=blue \
                --from-literal=APP_MOD=prod

#create configmap with file
kubectl create configmap \
    app-config --from-file=app_config.properties

#create config map with yaml file
kubectl create -f config-map.yaml

#view configmapsr
kubectl get confimaps

#describe confimaps
kubectl describe configmaps

#create config map in namespace
kubectl create configmap ingress-nginx-controller --namespace ingress-nginx


#----------------------------Secrets----------------------------------------
#create secret imperative way
kubectl create secret generic \ 
    app-secret-name --from-literal=DB_HOST=mysql
                    --from-literal=DB_USER=root
                    --from-LITERAL=DB_PASSWORD=password

#create secret imperaive way with file
kubeclt create secret generic \
    app-secret-name --from-file=app_secret.properties

#create secret with yaml file
kubectl create -f secret-data.yml

#get secrets
kubectl get secrets

#describe secrets
kubectl describe secrets

#get secrets data
kubectl get secret app-secret -o yaml 

#convert data to base64 in the terminal
echo -n "paswrd" | base64

#decode base64 data in the terminal
echo -n "cGFzd3Jk" | base64 --decode





#----------------------- SECURUTY---------------------------
#find the user that run a process
kubectl exec ubuntu-sleeper -- whoami
#see pod definition file to see how to add securyContext



#-----------------------SERVICE ACCOUNT---------------------------

#Two type of account service in kubernetes: user account and service account

#create service account. when you create a service account, it creates also a token stored in the secret object,
kubectl create serviceaccount dashboard-sa 

#create token for the serviceaccount dashboard-sa
kubectl create token dashboard-sa 

#view service accounts
kubectl get serviceaccount

#describe serviceaccount
kubectl describe serviceaccount dashboard-sa 

#view the service account token value
kubectl describe secret dashboard-sa-token-dbbdm

#For every name space in kubernetes, a default service account is created
#when a pod is created, the default service account token is automatically mounted inside the pod


#connect to the pod and view secrets file
kubectl exec -it my-kubernetes-dashboard -- ls /var/run/secrets/kubernetes.io/serviceaccount

#connect to the pod and view secrets token file
kubectl exec -it my-kubernetes-dashboard -- cat /var/run/secrets/kubernetes.io/serviceaccount/token

#get roles
kubectl get roles -n=ingress-nginx

        
#---------------------taint and toleration----------------------

#taint a node
#pod that do not tolerant the taint "taint-effect" can't be schdedule on the node
#3 type of taint: NoSchedule, PreferNoSchedule, NoExecute
kubectl taint nodes node-name key=value:taint-effect
kubectl taint nodes node-1 app=blue:NoSchedule

#add toleration to pod. you should go to the definition file and add the toleration


#view the taint of node(or the master)
kubectl describe node kubemaster | grep Taint

#untaint a node
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-



#---------------------------NODES-----------------------------------
#label a node
kubectl lablel nodes <node-name> <label-key>=<label-value>
kuctl label nodes node-1 size=Large

#add a nodeselector to the the pod, so that the place will be placed
#in the node with the corresponding label


#------------------------LOGS--------------------------------------
#view logs in container
#-f => to stream the logs life
docker logs -f containername

#view logs in kubernetes
kubectl logs -f pod-name

#if you have multiple containers in the pod, you should specify the containair name
kubectl logs -f pod-name container-name



#------------------Job-----------------
#create job
kubectl create -f job-definition.yaml

#get jobs
kubectl get jobs

#see log in the pod
kubectl logs pod-name

#delete job
kubectl delete job math-add-job


#------------- networkpolicy-------------------
kubectl get networkpolicies



#----------------------DEPLOY NGINX CONTROLLER------------------
# 1. create namespace
kubectl create namespace ingress-nginx

#2. create config map
kubectl creat configmap ingress-nginx

#3. create serviceaccount
kubectl create serviceaccount ingress-serviceaccount

#4. create Role and RoleBinding for the service account

#5. create deployment with definition file
kubectl create -f dep.yaml

#6. expose the deployment(create service NodePort)
kubectl expose deploy ingress-controller --name ingress --port=80 --targetport=80 --type Nodeport

#7. update the service to add the nodePort

#8. create ingress ressources
kubectl create ingress  simple --rule="/wear=wear-service:8080" --rule="/watch=video-service:8080"



#--------------------Persistent Volume------------------

#created persistent volume
kubectl create -f pv-definition.yaml


#-------------------------HELM------------------------------

#install package
helm install wordpress

#upgrade package
helm upgade wordpress

#rollback package
helm rollback wordpress

#uninstall package
helm uninstall wordpress

#helm
helm env
#version
helm version

#helm search
helm search hub wordpress

#list installed packages
helm  list

#list repo
helm  repo list

#uninstall specific release package 
helm  uninstall my-release

#download package but not install it. --untar to unrchive(extract the context) the file
helm  pull --untar bitnami/wordpress

#search for charts
artifacthub.io

#search for charts in order repository(bitnami)
    #1. add a repository to local helm setup
        helm repo add bitnami https://charts.bitnami.com/bitnami

    #2. search 
        helm search repo wordpress



#----------------------StatefulSet-------------------

#create stateful set
kubectl create -f statefulset-def.yaml