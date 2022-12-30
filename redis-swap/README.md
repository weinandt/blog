# Redis Swap

## Pre-reqs
1. AWS CLI is installed and configured.
1. terraform is installed
1. ssh-keygen installed

## Generate SSH key for ec2 (will also be used by ansible)
1. `ssh-keygen -t rsa -f infrastructure/ssh-keys/id_rsa`

## To Provision the Infrastructure:
1. `cd terraform`
1. `terraform init`
1. `terraform apply`


## To clean up
1. `cd terraform`
1. `terraform destory`

Note: ec2 instances will appear as "terminited" in the AWS console for roughly up to an hour while AWS cleans up.