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

## Start redis and enable swap
1. Add the public DNS for the instance to the ansible/hosts file.
2. From the ansible directory: `ansible-playbook -i hosts redis.yml && ansible-playbook -i hosts swap.yml`

## To SSH into the instance
1. `ssh -i infrastructure/ssh-keys/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@<publicDnsHere>`

## To populate redis with a bunch of data
1. `scp -i infrastructure/ssh-keys/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null populateRedis.py ubuntu@ec2DomainNameHere:~/populateRedis.py`
2. SSH into the machine
3. `python3 populateRedis.py | redis-cli --pipe`

## Benchmark redis
1. run `redis-benchmarks`: https://redis.io/docs/management/optimization/benchmarks/

## To clean up
1. `cd terraform`
1. `terraform destory`

Note: ec2 instances will appear as "terminited" in the AWS console for roughly up to an hour while AWS cleans up.