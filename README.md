# Autoscaling with Terraform,Pracker and Ansible
Adding Auto Scaling to our application architecture is to maximize the benefits of the AWS
cloud. When we use Auto Scaling, our applications gain the following benefits

# Better fault tolerance:
Auto Scaling can detect when an instance is unhealthy, terminate it,
and launch an instance to replace it. And also it configured Auto Scaling to multiple Availability
Zones. If one Availability Zone becomes unavailable, Auto Scaling can launch instances in
another one to compensate.

# Better availability:
Auto Scaling can help us to ensure that our application always has the right
amount of capacity to handle the current traffic demands

# Better cost management:
Auto Scaling can dynamically increase and decrease capacity as
needed. Because we pay for the EC2 instances that we use, we save money by launching
instances when they are actually needed and terminating them when they aren't needed.

# Architecture

![alt tag](https://cloudcraft.co/view/ae9f9864-77b4-4bc8-b285-e9c8ef85fc4d?key=XQIZN-8AMpdpiaskk-pm4g)

This is fully end to end automated system and fully scalable and can accommodate 99.99 % uptime. Used Terraform as a Iaac and Ansible and Packer for Blue-Green deployment.Used Jenkins as for CI/CD automation and enabled user interaction endpoint.


