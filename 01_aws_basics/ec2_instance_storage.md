# EC2 Instance Storage

## EBS Snapshot 

- To create backup (snapshot) of EBS volume at a point in time
- Not necessary to detach volume to do snapshot, but recommended to detach / shutdown EC2 instances before taking a snapshot
- Can copy snapshots across AZ / Region

### Fast Snapshot Restore (FSR)

- Snapshot stored in S3
- By default there's a latency of I/O for the first time each block is accessed
- Solution: force the initialization of entire volume (using dd or fio command), or can enable FSR
- FSR help create volume from snapshot that fully initialized at creation with no I/O latency
- enabled for snapshot in particular AZ (billed per minute and very expensive)
- can be enabled on snapshot created by **Data Lifecycle Manager**


## EBS Multi-Attach - io 1 / io2 family

- Attach the same EBS volume to multiple EC2 instances in the same AZ
- Each instance has full read and write permissions to the high performance volume
- Up to 16 EC2 instances in the same time
- Must use a filesystem that's cluster aware (not XFS, EXT4)
Use case:
- Achieve **higher application availability** in clustered Linux applications (ex: Teradata)
- Applications must manage concurrent write operations

## Amazon Elastic File System (EFS)

- use for content management, web serving, data sharing, wordpress
- use NFSv4.1 protocol
- use security group to controll access to EFS
- compatible with Linux only
- encryption at rest using KMS
- POSIX file system that has a standard file API
- file system scale automatically, pay per use, no need for capacity planning

### EFS Access Points

- easily manage application to access NFS environment
- enforce POSIX user and group to use when access the file system
- restrict access to directory within file system, and optionally specify different root dir
- can restrict access from NFS client using IAM policies

### EFS Operations

- Operations that can be done in place
    - lifecycle policy (enable IA or change IA settings)
    - throughput mode and provisioned throughput
    - efs access points
- Operations that require migration using **DataSync** replicates all file attributes and metadata
    - migration to encrypted EFS
    - performance mode (ex: Max IO)

## Summary

- **Elastic Block Store (EBS)**: are network drives that attached to one EC2 instance at a time. It's mapped to specific Availability Zone, we can use EBS snapshot to perform backup or transfer data across another Availability Zones.
- **Amazon Machine Images (AMI)**: are ready to use customized EC2 instance image. To automate building AMI, use EC2 image builder service that automatically builds, test, and distributes AMI.
- **EC2 Instance Store**: provides high performance hardware disk that attached directly to EC2 instance, but the data stored in instance store will be lost if the instance stop or in case hardware failures.
- **Elastic File System (EFS)**: It's network file system that can be attached to multiple instances at once within the region. There are no availabilty zones lock since it operate on region level. To optimize cost, use EFS-Infrequent Access (EFS-IA) which allow to move file that are infrequently used to lower the storage tier cost.
- **FSx File System**: we have FSx for Windows that provide network file system for Windows Server, and FSx for Lustre which designed for high-performance computing on Linux.