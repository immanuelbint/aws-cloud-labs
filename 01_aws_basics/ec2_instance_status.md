## SYSTEM status checks

System status checks monitor the AWS systems on which your instance runs

Problem with the underlying host / baremetal. Example: 
- Loss of network connectivity
- Loss of system power
- Software issues on the physical host
- Hardware issues on the physical host that impact network reachability

Either wait for AWS to fix the host, or Move the EC2 instance to a new host / STOP & START the instance (if EBS backed)

## INSTANCE status checks

Instance status checks monitor the software and network configuration of your EC2 instance

Example issues
- Incorrect networking or startup configuration
- Exhausted memory
- Corrupted file system
- Incompatible kernel

Requires your involvement to fix
- Restart the EC2 instance
- Change the EC2 instance configuration

## Attached EBS status checks

Attached EBS status checks monitor the EBS volumes attached to your individual instance

Example issues

- Hardware or software issues on the storage subsystems underlying the EBS volumes
- Hardware issues on the physical host that impact reachability of the EBS volumes
- Connectivity issues between the instance and EBS volumes

Requires your involvement to fix
- Restart the EC2 instance
- Replace the affected EBS volumes