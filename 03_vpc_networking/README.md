## **Learning VPC**

In this hands-on lab, I’m practicing how to create and configure an Amazon VPC (Virtual Private Cloud) to understand basic networking concepts in AWS, including subnets, route tables, internet gateways (IGW), and security groups.

## Architecture Diagram

![](resources/vpc-architecture.png)

## Requirement

- AWS Account
- User with permissions to:
    - Create VPC
    - Create Subnets (Public & Private)
    - Create and configure Route Tables
    - Create Internet Gateway
    - Create Security Groups & NACLs

### Objectives

* Create VPC
* Setup public & private subnets
* Configure routing & security

## Step 1: Create VPC

1. In the AWS console, search for VPC
2. Click create VPC -> select VPC only
![](resources/1.png)

3. Enter a name (e.g., MyLabVPC), CIDR block 10.0.0.0/16.
![](resources/2.png)
![](resources/3.png)

### Notes:
- Public subnet = connected to Internet Gateway.
- Private subnet = internal only (can use NAT Gateway for outbound internet access).

## Step 2: Setup Subnets

1. Go back into VPC dashboard, and select Subnets
![](resources/4.png)

2. Create Public Subnet:
    - CIDR block 10.0.1.0/24
    - Availability Zone: ap-southeast-2a
![](resources/5.png)
3. Create Private Subnet:
    - CIDR block 10.0.2.0/24
    - Availability Zone: ap-southeast-2b
![](resources/6.png)
![](resources/7.png)

### Notes:
- Public subnet = connected to Internet Gateway.
- Private subnet = internal only (can use NAT Gateway for outbound internet access).

## Step 3: Configure Routing

1. Create an Internet Gateway (IGW) and attach it to the VPC.
![](resources/8.png)
![](resources/9.png)
![](resources/10.png)

2. Create Route Table for the public subnet:
    - Add route to 0.0.0.0/0 → target IGW.
    - Associate with Public Subnet.

![](resources/11.png)

![](resources/public-route-table.png)

Now attach the Public Subnet to Public Route Table

![](resources/attach-subnet-to-routetable.png)

Create route table, to give internet access to public subnets, target to IGW we have created.

![](resources/add-route-to-publicroutetables.png)
![](resources/public-route-table2.png)

3. (optional) Create Route Table for the private subnet , if using NAT Gateway.

## Step 4: Test the new VPC (Public Subnet)

1. Create Security Group for Public Subnet:
    - Inbound: allow SSH (22), HTTP (80).
    - Outbound: allow all.

![](resources/create-sg.png)

Specify name, and description (optional), and attach VPC to VPC that we have created from before, for the rules, add SSH and HTTP rule.

> Do not allows ssh from 0.0.0.0/0 in Production, this is only for learning purposes.

![](resources/create-sg2.png)

2. Go to EC2 -> launch instance, attach VPC, and Security Groups created earlier

![](resources/launch-instance.png)

3. After that let's try to connect to the new EC2 instance using EC2 Instance Connect

![](resources/launch-instance2.png)

4. As we can see, we can connect to our EC2 using VPC and public subnet that we have created before, the EC2 instance also have internet access.

![](resources/launch-instance3.png)

## (TODO) Step 5: Configure Private Subnet with NAT Gateway

Under Construction: Later I’ll add steps for:
    - Creating NAT Gateway in Public Subnet
    - Route Table for Private Subnet → NAT Gateway
    - Launching EC2 in Private Subnet (outbound internet only, no inbound access)

## AWS CLI command

```bash
# Create VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications \
'ResourceType=vpc,Tags=[{Key=Name,Value=MyLabVPC}]'

# Create Subnet
aws ec2 create-subnet --vpc-id vpc-123456 \
--cidr-block 10.0.1.0/24 --availability-zone ap-southeast-2a

# Create IGW
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id vpc-123456 --internet-gateway-id igw-123456
```

## Lesson Learned

- VPC = network isolation in AWS, giving you full control over subnets & routing.
- Public vs Private subnets → only place resources in public that truly need internet access.
- Security Groups are stateful, while NACLs are stateless.
- Route Tables control traffic flow in and out of the network.
- CIDR planning is crucial for future scalability.

## Reference

- WS Official Docs: [Getting Started with VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- AWS Training & Certification Labs

---