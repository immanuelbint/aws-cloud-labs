# EC2 Instance Storage

## Summary

- **Elastic Block Store (EBS)**: are network drives that attached to one EC2 instance at a time. It's mapped to specific Availability Zone, we can use EBS snapshot to perform backup or transfer data across another Availability Zones.
- **Amazon Machine Images (AMI)**: are ready to use customized EC2 instance image. To automate building AMI, use EC2 image builder service that automatically builds, test, and distributes AMI.
- **EC2 Instance Store**: provides high performance hardware disk that attached directly to EC2 instance, but the data stored in instance store will be lost if the instance stop or in case hardware failures.
- **Elastic File System (EFS)**: It's network file system that can be attached to multiple instances at once within the region. There are no availabilty zones lock since it operate on region level. To optimize cost, use EFS-Infrequent Access (EFS-IA) which allow to move file that are infrequently used to lower the storage tier cost.
- **FSx File System**: we have FSx for Windows that provide network file system for Windows Server, and FSx for Lustre which designed for high-performance computing on Linux.