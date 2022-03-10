## step1 kubectl init ,plan apply crated rds and eks cluster

# to set kubeconfig file
aws eks update-kubeconfig --name terraform-eks-myCluster


# Below command creates all the required services.
 kubectl apply -f kube-manifests/

 # command to test RDS configuration 
 kubectl run -it --rm --image=mysql:5.7.22 --restart=Never mysql-client -- mysql -h usermgmtdb.cjoafmz9loud.us-east-1.rds.amazonaws.com -u dbadmin -pdbpassword11

