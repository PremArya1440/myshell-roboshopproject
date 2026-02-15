#!/bin/bash

SG_ID="sg-08ccf1ff6b7744e3c"   #replace  with your security group id
AMI_ID="ami-0c55b159cbfafe1f0"   #replace with your AMI id
ZONE_ID="Z0425694W58WDQOZHX5V"   #replace with your availability zone
DOMAIN_NAME="4sinfotech.in"   #replace with your domain name

for instance in $@
do
# aws ec2 run-instances --image-id ami-0220d79f3f480ecf5 --instance-type t3.micro --security-group-ids sg-08ccf1ff6b7744e3c --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" 

$INSTANCE_ID= 

$(aws ec2 run-instances \
--image-id $AMI_ID \ 
--instance-type t3.micro \
--security-group-ids $SG_ID \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" \
--query 'Instances[0].InstanceId' \
--output text ) 
if [ instance == "frontend" ]; then
   IP=$(   
      aws ec2 describe-instances \
       --instance-ids $INSTANCE_ID \
       --query 'Reservations[].Instances[].PublicIpAddress' \
        --output text
   )
   else
    IP=$(
        aws ec2 describe-instances \
         --instance-ids $INSTANCE_ID \
         --query 'Reservations[].Instances[].PublicIpAddress' \
          --output text
    )

    fi
    echo "IP Address: $IP"
done
