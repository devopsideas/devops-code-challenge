# Devops Code Challenge - AWS Automation
DevopsIdeas Code Challenge - Task 2

----------


**Bash script for below code challenge**

 - Automate the process of stop

Automate the process of stop to a group of EC2 instances (based on tags). Ensure that there is no user
logged into the servers, and CPU usage is idle ( less than 10% ) for the particular period of time before stopping. The idle period and tag will be passed as arguments.

    usage: autostop <Tag name> < idle period>

For example:

    autostop <development> 30

If the current time is 7 PM, the script needs to check the idle development instances in the last 30
minutes ( 6.30 PM to 7 PM ) and make sure no users are logged into those instances before stopping them. Don’t set up permanent cloudwatch alarm to stop the instances. The script needs to run on-demand for stopping the instances.


