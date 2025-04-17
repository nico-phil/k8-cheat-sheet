
#set context
kubectl config --kubeconfig=/root/my-kube-config use-context research

#to know the current context
kubectl config --kubeconfig=/root/my-kube-config current-context

#get info about kube-api-server
cat /etc/kubernetes/manifests/kube-apiserver.yaml

#get roles
kubectl get roles

#get roles in all namepsace
kubectl get roles -A --no-headers | wc -l

#get role associated with a user
kubectl get rolebindings

#get pods specifiying the user
kubectl get pods --as dev-user

#check if a user can perform a certain action
kubectl auth can-i create deployment
kubectl auth can- delete nodes


#--------------cluster roles-----------
#get namespaced resource and non-namespaced resources
kubectl api-resources --namespaced=true
kubectl api-resources --namespaced=false



#-----------------ADMISSION CONTROLLER----------------

#view enabled admission controllers by default
kube-apiserver -h | grep anable-admission-plugins

#get api server pod
kubectl get pod -n kube-system

#conect to the apiserver pod and get admision controllers
kubectl exec kube-apiserver-controlplane -n kube-system -- kube-apiserver -h | grep enable-admission-plugins


#------------Kubesystem Pod--------------------------
