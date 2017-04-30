#!/bin/bash

#Set the minimum CPU threshold that is considered idle
cpu_threshold=10

#Path of the ec2 key to use along with its name
ec2_key=<key file name>

echo "Checking for Idle instances to Stop..."
echo ""

instances=`aws ec2 describe-instances --filters "Name=tag:Name,Values=${1}" "Name=instance-state-name,Values=running" | jq -r ".Reservations[].Instances[].InstanceId"`
t1=$(date -u +%FT%TZ)
time_range="-${2} minutes"
t2=`date -u "+%FT%TZ" -d "$time_range"`

for instance in ${instances}
do
        ip=`aws ec2 describe-instances --instance-ids ${instance} | jq -r ".Reservations[].Instances[].PublicIpAddress"`
        users_check=`ssh -i ${ec2_key} ec2-user@${ip} users | wc -w`
        if [ ${users_check} -eq 0 ]; then
            cpu_check=`aws cloudwatch get-metric-statistics --metric-name CPUUtilization --start-time ${t2} --end-time ${t1} --period 300 --namespace AWS/EC2 --statistics Average --dimensions Name=InstanceId,Value=${instance} | jq -r ".Datapoints[].Average"`
            for cpu in ${cpu_check}
            do
		cpu_roundoff=`printf "%.0f\n" ${cpu}`
                if [ ${cpu_roundoff} -gt ${cpu_threshold} ]; then
                    condition=invalid
                    break
                else
                    condition=valid
                fi
            done
            
            if [ ${condition} == "valid" ]; then
                echo "${instance} - Instance is idle. Stopping instance..."
		aws ec2 stop-instances --instance-ids ${instance}
		echo ""
 	    else
		echo "${instance} - CPU utilization is above ${cpu_threshold}% in the past ${2} minutes"
            fi
            
        else
            echo "${instance} - Has ${users_check} user(s) logged in"
	    echo ""
        fi
done
	
