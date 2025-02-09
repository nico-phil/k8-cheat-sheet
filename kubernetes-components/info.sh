#start minikube
minikube start

#stop minikube
minikube stop

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

#delete pod
kubectl delete pod my-pod

#generate pod quickly and put it in file, so that you can modify it
kubectl run nginx --image=nginx --dry-run=client -o yaml > nginx-pod.yaml



#-------- ReplicatSet/ReplicaController ------------------------


#create replicatioSet
kubectl apply -f replicaset-definition.yml

#info about replicat set
kubectl get replicaset

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

#get deployments
kubectl get deployments

#update the file with edit
kubectl edit deployment myapp-deployment

#update image, choose one of them
kubectl apply -f deployment-defintion.yaml
kubectl set image deployment myapp-deployment nginx-container=nginx:1.9.1

#status
kubectl rollout status deployment/myapp-deployment
kubectl rollout history deployment/myapp-deployment

#rollback deployment
kubectl rollout undo deployment/myapp-deployment

#get all objects
kubectl get all

#Generate Deployment with 4 Replicas
kubectl create deployment nginx --image=nginx --replicas=4

#You can also scale deployment using the kubectl scale command.
kubectl scale deployment nginx --replicas=4

#-------- Service---------------------------------------------------


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


----------------------------Secrets-----------------------------
#create secret imperative way
kubectl create secret generic \ 
    app-secret-name --from-literal=DB_HOST=mysql
                    --from-literal=DB_USER=root
                    --from-LITERAL=DB_PASSWORD=password

#create secret imperaive way with file
kubeclt crete secret generic \
    app-secret-name --from-file=app_secret.properties

#create secret with yaml file
kubectl create -f secret-data.yml

#get secrets
kubectl get secrets

#describe secrets
kubectl describe secrets

#get secrets data
kubectl get secret app-secret -o yaml 




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



        



