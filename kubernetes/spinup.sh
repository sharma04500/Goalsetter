#!/bin/bash
user=`whoami`

##################################################################################
##################################################################################
##                 MANDATORY CHECKS BEFORE EXECUTING THIS SCRIPT
##
##        Install EFS CSI Driver after provisioning efs for the cluster.
##        Install AWS LoadBalancer Controller to enable ingress to provision
##  an Application Load Balancer.
##        Check if the IAM role is available for the service account.
##        Ensure the availability of node labels as mentioned in the mongosts.yaml
##        Store the self-signed certificate from openssl as a TLS type secret as 
## mentioned in the ingress.yaml
##
##  Author: Sharma Akella      
#####################################################################################
#######################################################################################

if [ $user != ubuntu ]; then
  echo "This script should be executed by ubuntu user only. Stopping..."
  exit 1
fi

set -xe

kubectl create -f namespace.yaml && sleep 10
kubectl create -f storageclass.yaml && sleep 10
kubectl create -f jenkins.yaml && sleep 10
kubectl create -f mongosts.yaml && sleep 30
kubectl create -f application.yaml && sleep 20
kubectl create -f ingress.yaml && sleep 10
kubectl create -f sa-cron.yaml && sleep 10
kubectl create -f mongo-cron.yaml && sleep 10
kubectl create -f aws-cron.yaml && sleep 10

echo " Cheers!! Successfully turned up all the resources.!!! "
echo " Exec into the mongo and perform Replica Configuration. "