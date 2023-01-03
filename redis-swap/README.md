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

## To Run Ansible
1. Add the public DNS for the instance to the ansible/hosts file.
2. From the ansible directory: `ansible-playbook -i hosts update.yml`

## To SSH into the instance
1. `ssh -i infrastructure/ssh-keys/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@<publicDnsHere>`

## Allocate swap
1. `df -h`
    - Make sure you have enough disk space.
1. `sudo fallocate -l 1G /swapfile`
1. `sudo chmod 600 /swapfile`
1. `sudo mkswap /swapfile`
1. `sudo swapon /swapfile`
1. `free -h`

## To populate redis with a bunch of data
1. `VERY_LONG_STRING=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa`
2. `for i in {1..1000000}; do echo "SET $i $VERY_LONG_STRING" >> bulk.txt ; done`
3. `cat bulk.txt | redis-cli --pipe`


## To clean up
1. `cd terraform`
1. `terraform destory`

Note: ec2 instances will appear as "terminited" in the AWS console for roughly up to an hour while AWS cleans up.