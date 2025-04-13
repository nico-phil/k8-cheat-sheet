
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
