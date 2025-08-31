# Amazon Elastic Compute Cloud (EC2)

It's a part of Amazon's cloud-computing platform, Amazon Web Services (AWS), that allows users to rent virtual computers on which to run their own computer applications.

## EC2 Instance Types Basic

There are many types of EC2 instances that you could use for various use case, each optimized differently. Currently there are 7 type of EC2 instances available.

### AWS EC2 Instance Naming

- **M** represent instance class, it's for general purpose type.
- **5** indicates generation of the instance, reflect the hardware improvement over time.
- **2xlarge** are the size within instance class, starts from small, large, 2xlarge, 4xlarge, and so forth.

### General Purpose Instance

Are suitable for diversity of workloads such as web server, code repository, etc. It provide balance combination of compute, memory, and networking.

### Compute Purpose Instance

Compute optimized are designed for task that require high level processor performance. Mainly used for task that include batch processing, media transcoding, high performance web server, high performance computing (HPC), machie learning, and dedicated gaming server. These instance are identified by **c** series, such as **c5** and **c6**.

### Memory Optimized Instance

Memory optimized deliver fast performance for workloads that process data in large scale sets in memory (RAM). Ideal for relational and non relational databases, in memory databases for business intelligence (BI), and application perform real time process of large unstructured data. These instance are identified in the **R** series, **X1**, High Memory, and **Z1** instance.

### Storage Optimized Instance

Suitable when accessing large data set on local storage. Intended for use case that require high frequincy online transaction processing (OLTP) systems, relational and NoSQL databases, in memory caches such as Redis, data warehouse, distribute file system. These instance are identified with **I**, **D**, or **H1**

## EC2 Instance Purchasing Options

- EC2 On-Demand Instances: with on demand instance, you pay for what you use, for linux or windows it's billed per second after the first minute, for other operating system it's billed per hour. On-demand have the highest cost but not required to upfront payment or long term commitments.

- Reserved Instances: offers up to 72% discounts compared to on-demand instance, you reserve specific instance attributes such as instance type, region, tenance, operating system, etc. Reservation period can be one or three years with option for upfront, partial, partial upfront, or no upfront payments.

- EC2 Savings Plans: provide similar discounts to reserved instance, and it's based on long-term usage and commitments. Instead of commit to specific instance attribute, you need to commit specific hourly spend amout for one or three years, and any usage beyond that are charged at on-demand prices.

- Spot Instances: you define a maximum price you're willing to pay. If the spot exceeds your maximum, your instance can be terminated. Spot instances are cost efficient and suits for workloads resilient to failure, such as batch jobs, data analysis, image processing, etc. Spot are not suitable for critical jobs or databases.

- Dedicated Hosts: provided an actual physical server that are dedicated to your use. It's useful for compliance requirement or when using server bound software licenses that are billed per socket, core, or virtual machine. Dedicated hosts are the most expensive AWS option because you're reserve an entire physical server.

- Capacity Reservations: allow you to reserve on-demand instances in specific Availability Zone for any duration. You don't have to commit time and can cancel your reservation at any time. There are no billing discount, you pay on-demand rates whether or not you run instances.