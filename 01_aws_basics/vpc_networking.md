# VPC and Networking in AWS

## Understanding CIDR - Subnet Mask

The Subnet Mask basically allows part of the underlying IP to get additional next values from the base IP, e.g.,

```
192.168.0.0/32 => allows for 1 IP -> 192.168.0.0
192.168.0.0/31 => allows for 2 IP -> 192.168.0.0  -> 192.168.0.1
192.168.0.0/30 => allows for 4 IP -> 192.168.0.0  -> 192.168.0.3
192.168.0.0/29 => allows for 8 IP -> 192.168.0.0  -> 192.168.0.7
192.168.0.0/28 => allows for 16 IP -> 192.168.0.0  -> 192.168.0.15
192.168.0.0/27 => allows for 32 IP -> 192.168.0.0  -> 192.168.0.31
192.168.0.0/26 => allows for 64 IP -> 192.168.0.0  -> 192.168.0.63
192.168.0.0/25 => allows for 128 IP -> 192.168.0.0  -> 192.168.0.127
192.168.0.0/24 => allows for 256 IP -> 192.168.0.0  -> 192.168.0.255
---
192.168.0.0/16 => allows for 65,536 IP
---
192.168.0.0/0 => allows for All IP address -> 0.0.0.0 -> 255.255.255.255
```

Quick Memo

```
---.---.---.---
1st 2nd 3rd 4th

/32 - no octet can change
/24 - last octet can change
/16 - last 2 octet can change
/8  - last 3 octet can change
/0  - all octet can change
```

## VPC in AWS - IPv4

- VPC stand for Virtual Private Cloud, you can have multiple VPCs in AWS region (max 5 per region - soft limit).
- Max CIDR per VPC is 5, for each CIDR
    - Min. size is /28 (16 IP Address)
    - Max. size is /16 (65536 IP Address)
- Because VPC is private, only Private IPv4 range are allowed
    - 10.0.0.0 - 10.255.255.255 (10.0.0.0/8)
    - 172.16.0.0 - 172.31.255.255 (172.16.0.0/12)
    - 192.168.0.0 - 192.168.255.255 (192.168.0.0/16)
- The VPC CIDR shouldn't overlap with other networks 

## VPC Subnet (IPv4)

- AWS reserve 5 IP Address (first 4 and last 1) in each subnet
- These 5 IP are not available for use, and can't be assign to EC2 instance

## Internet Gateway (IGW)

- Allow resources (e.g., EC2 instances) in VPC to connect to the internet
- It scale horizontally and is highly available and redundant
- Must be created separately from a VPC
- One VPC can only be attached to one IGW and vice versa
- Internet Gateway on their own do not allow Internet access, you need to setup Route Tables first


## NAT Gateway

- AWS managed NAT, have higher bandwidth, high availability, no administration
- Pay per hour for usage and bandwidth
- NATGW is created in specific AZ, and need to use Elastic IP
- Cannot be used by EC2 instance in the same subnet (only from other subnet)
- Require internet gateway (Private subnet -> NAT GW -> IGW)
- 5 Gbps of bandwidth with automatic scaling up to 100 Gbps
- No security groups to manage / required

## Network Access Control List (NACL)

- NACL are like firewall which control traffic from and to subnets
- One NACL per subnet, new subnets are assigned the default NACL
- You define NACL rules:
    - Rules have number (1-32766), higher precedence with lower number
    - First rule match will drive the decision
    - Example if you define # 100 ALLOW 10.0.0.10/32 and # 200 DENY 10.0.0.10/32, the IP Address will be allowed because 100 has higher precedence over 200
    - The last rule is an asterisk (*) and denies a request in case of no rule match
    - AWS recommends adding rules by increment of 100
- Newly created NACL will deny everything
- NACL are great way to block specific IP Address at subnet level

## VPC Peering

- Privately connect two VPCs using AWS network
- Make them behave as if they were in the same network
- Must not have overlapping CIDRs
- VPC Peering connection is NOT transitive (must be established for each VPC that need to communicate with one another)
- You must update route table in each VPC subnets to ensure EC2 isntance can communicate each other

## VPC Endpoints (AWS PrivateLink)

- Every AWS service is public exposed
- VPC EndPoints (powered by AWS PrivateLink) allows you to connect to AWS service using private network instead of public internet
- They are redundant and scale horizontally
- They remove the need of IGW, NATGW to access AWS service
- If there are issue
    - check DNS setting resolution in VPC
    - check route tables

## VPC Flow Logs

- Capture information about IP traffic going into your interfaces, such as:
    - VPC flow logs
    - Subnet flow logs
    - Elastic Network Interface (ENI) flow logs
- Help monitor and troubleshoot connectivity issues
- Flow logs can go to S3, CloudWatch logs, and Kinesis Data Firehose
- Captures network information from AWS managed interfaces too: ELB, RDS, ElastiCache, Redshift, WorkSpaces, NATGW, Transit Gateway

## AWS PrivateLink (VPC Endpoint Service)

- Most secure and scalable way to expose a service to 1000s of VPC (owned or other accounts)
- Does not require VPC peering, internet gateway, NAT, route tables
- Requires network load balancer (service VPC) and ENI (customer vpc) or GWLB
- If the NLB is in multiple AZ, and ENI in multiple AZ, the solution is fault tolerant

## AWS Transit Gateway

- For having transitive peering between thousands of VPC and on premises, hub and spoke (star) connection]
- Regional resource, can work cross region
- Share cross account using Resource Access Manager (RAM)
- You can peer transit gateway across regions
- Route tables: limit which VPC can talk with other VPC
- Works with Direct Connect Gateway, VPN connection
- Suports IP Multicas (not supported by any other AWS Service)

## Egress only Internet Gateway

- Used for IPv6 only
- similar to NAT gateway but for IPv6

## Summary

- Virtual Private Cloud (VPC) and Subnets: Within a VPC, you have subnets. Each subnet is tied to a specific availability zone and represents a network partition within your VPC.
- Internet Gateway: Allows internet access at the VPC level, need to create internet gateway, for private instances located on private subnets, internet access is provided through NAT gateway which managed by AWS, or NAT instances that you manage yourself.
- Network Access Control List (NACL): Provide stateless firewall rules at the subnet level for inbound and outbound traffic. 
- Security Groups: Provide stateful firewall rules operating at the EC2 instance or Elastic Network Interface (ENI) level.
- VPC Peering: allows connect two VPCs together using VPC peering if they have non-overlapping IP ranges,
- Elastic IP: Fixed public IPv4 addresses, will incur ongoing costs if it's allocated even if they are not associated with a running instance.
- VPC Endpoints: Provide private access to AWS services within VPC.
- PrivateLink: Allows private connect to a service in a 3rd party VPC.
- VPC Flow Logs: Used to monitor network traffic logs.
- Site to Site VPN: VPN over public internet between on-premises Data Center and AWS.
- Client VPN: OpenVPN connection from your computer into VPC.
- Direct Connect: Establishes a private, dedicated connection between AWS and your data center. Take note it's will cost you more.
- Transit Gateway: Allows you to connects thousands of VPCs, on-premises networks, site-to-site VPNs, and Direct Connect connections into a single network hub.

## Key Takeaways

- A VPC (Virtual Private Cloud) contains subnets, each tied to a specific availability zone representing network partitions.
- Internet access for VPCs requires an Internet Gateway; private subnets use NAT gateways or NAT instances for outbound internet access.
- Network ACLs provide stateless firewall rules at the subnet level, while security groups offer stateful rules at the instance or ENI level.
- VPC peering connects VPCs with non-overlapping IP ranges but is non-transitive.
- Elastic IPs are fixed public IPv4 addresses that incur costs when unused.
- VPC Endpoints enable private access to AWS services; PrivateLink allows private connections to third-party services.
- VPC Flow Logs capture network traffic logs.
- Private connectivity options include site-to-site VPN, client VPN, Direct Connect, and Transit Gateway for large-scale network integration.