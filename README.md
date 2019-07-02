# TerraformAWS
Test AWS template
This is a sample Terraform template for AWS. 

This creates a sample set-up with 3 subnets, 2 Lunch Configuration, 2 AutoScalingGroup, 2 Routes, 
an Internet Gateway attached to the VPC, a NAT Gateway on Public subnet. 

An Application LoadBalancer is also create which has a listner that listens on port 80 and forwards traffic to Target Group.
This Target Group is then ssociated with AutoScalingGroup.
