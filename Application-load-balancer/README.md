## prerequiste launch EKS cluster  
  cd eks-cluser
  terrraform init  
  ## add tags to modules module.aws_vpc.module.aws_vpc.aws_subnet.public_subnets
  "Kubernetes.io/role/elb" = "1" && "Kubernetes.io/role/internal-elb" = "1"

  terraform plan and apply.


  aws eks update-kubeconfig --name terraform-eks-cluster

## Step-01:  Create IAM policyy
cd iam --> terraform init, plan and apply creates all the services -- use in next step

## Step-03: create IAM service account
eksctl create iamserviceaccount \
  --cluster=terraform-eks-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::834652494746:policy/sa_policy \
  --override-existing-serviceaccounts \
  --approve

 ## if fails
  eksctl utils associate-iam-oidc-provider \
    --region=us-east-1 \
    --cluster=terraform-eks-cluster \
    --approve

## step -4 :helm install for aws-load-balancer-controller
## Replace Cluster Name, Region Code, VPC ID, Image Repo Account ID and Region Code  
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=terraform-eks-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=us-east-1 \
  --set vpcId=vpc-0581db1b5c47442ff \
  --set image.repository=602401143452.dkr.ecr.us-east-1.amazonaws.com/amazon/aws-load-balancer-controller

## step -5 : install ingress class
cd lb & kubectl apply -f ingressclass-resource.yaml

## step - 6 : install backend deployments
kubectl apply -f 01-kube-manifests-default-backend/
