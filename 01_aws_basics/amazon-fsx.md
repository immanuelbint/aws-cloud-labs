# Amazon FSx Overview

Launch 3rd party high performance file system on AWS, it's fully managed service

## Amazon FSx for Windows (file server)

- fully managed windows file system share drive
- supports SMB protocol & windows NTFS
- microsoft Active Directory integration, ACLs, user quotas
- can be mounted on linux EC2 instances
- supports Microsoft's Distributed File System (DFS) Namespaces (group files across multiple FS)
- scale up to 10s of GB/s, millions of IOPS, 100s PB of data
- Storage option
    - SSD, latency sensitive workloads (database, media processing, data analytics)
    - HDD, broad spectrum of workloads (home dir, CMS)
- can be accessed from your on-premises infra (via VPN or Direct Connect)
- can be configured to be Multi-AZ (high availability)
- data is backed up daily to S3

## Amazon FSx for Lustre

- parallel distributed file system for large scale computing
- Lustre is derived from "Linux" and "cluster"
- mainly used for Machine Learning, High Performance Computing (HPC), video processing, financial modeling, electronic design automation
- scales up to 100s GB/s, millions of IOPS, sub-ms latencies
- storage options:
    - SSD, low latency, IPS intensive workloads, small and random file operations
    - HDD, throughput intensive workloads, large and sequential file operations
- seamless integration with S3
    - can read S3 as file system through FSx
    - can write output of computations back to S3 through FSx
- can be used from on premises servers (VPN or Direct Connect)

## FSx File System Deployment Options

**Scratch File System**
- temporary storage
- data is not replicated (doesn't persist if file fails)
- high burst (6x faster, 200MBps per TiB)
- for short term processing, optimize cost

**Persistent File System**
- long term storage
- data is replicated within same AZ
- replace failed file within minutes
- for long term processing sensitive data

## Amazon FSx for NetApp ONTAP

- managed NetApp ONTAP on AWS
- file system compatible with NFS, SMB, iSCSI protocol
- move workloads running on ONTAP or NAS to AWS
- works with linux, windows, macOS, VMware Cloud, Amazon workspaces & appstream 2.0, Amazon EC2, ECS and EKS
- storage shrinks or grow automatically
- snapshot, replication, low cost, compression and data de-duplication
- point in time instantaneous cloning (helpful for test new workloads)

## Amazon FSx for OpenZFS

- managed openZFS file system on AWS
- compatible with NFS (v3, v4, v4.1, v4.2)
- move workloads running on ZFS to AWS
- works with linux, windows, macOS, VMware Cloud, Amazon workspaces & appstream 2.0, Amazon EC2, ECS and EKS
- Up to 1,000,000 IOPS with < 0.5 ms latency
- snapshots, compression and low cost
- point in time instantaneous cloning (helpful for test new workloads)