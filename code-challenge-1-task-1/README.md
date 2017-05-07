# Devops Code Challenge - AWS Automation
DevopsIdeas Code Challenge - Task 1

----------


**Ansible role for the below code challenge**

**Task 1**: Automate the EC2 instance creation under load balancer.

1. Create a VPC with should have a public and private subnet

2. Create a role with s3 access.

3. Launch an ec2 instance with the role created in step 1, inside the private subnet of VPC, and install apache through

bootstrapping. ( You need to have your NAT gateway attached to your private subnet )

4. Create a load balancer in public subnet.

5. Add the ec2 instance, under the load balancer


Once you have the basic functionality implemented, try to do the following bonus exercises in Task1:


**Bonus Task:**

1. Create an auto scaling group with minimum size of 1 and maximum size of 3 with load balancer created in step 3.

2. Add the created instances under the auto scaling group. ( You need to have an AMI created out of previously created instance in Task 1 which has apache installed in it)

3. Write a life cycle policy with the following parameters:

scale in : CPU utilization > 80%

scale out : CPU Utilization < 60%


