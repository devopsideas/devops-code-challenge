**Task 1**: Automate the EC2 instance creation under load balancer.

1. Create a role with s3 access.

2. Launch an ec2 instance with a role inside the private subnet of VPC, and install apache through bootstrapping.

3. Create a load balancer in public subnet.

4. Add the ec2 instance, under the load balancer



Once you have the basic functionality implemented, try to do the following bonus exercises in Task1:


**Bonus Task:**

1. Create an auto scaling group with minimum size of 1 and maximum size of 3 with load balancer created in step 3.

2. Add the created instances under the auto scaling group.

3. Write a life cycle policy with the following parameters:

scale in : CPU utilization > 80%

scale out : CPU Utilization < 60%

