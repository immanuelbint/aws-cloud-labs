# VPC and Networking in AWS

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