# Redis Swap

## Pre-reqs
1. AWS CLI is installed and configured.
1. terraform is installed

## To Provision the Infrastructure:
1. `cd terraform`
1. `terraform init`
1. `terraform apply`


## To clean up
1. `cd terraform`
1. `terraform destory`

Note: ec2 instances will appear as "terminited" in the AWS console for roughly up to an hour while AWS cleans up.