# Leveraging the AWS Global Infrastructure

### AWS Route 53

Route 53 allows to create DNS, create records, how to point them from hostnames to IP addresses, and to route users to the closest deployment with low latency, it's also very helpful when defining disaster recovery strategies.

### CloudFront Content Delivery Network

CloudFront connected to Amazon S3, the ideas is we replicated part of our application data into AWS Edge Locations, this allows to decrease latency, and also CloudFront caches common request which improves user experience and further reduces latency.

### S3 Transfer Acceleration

Enables accelerated global uploads and downloads into Amazon S3. It's leverages AWS Edge Locations to improve transfer speeds.

### AWS Global Accelerator

AWS Global Accelerator also leverages AWS Edge Locations and global network, provides improve global application availability and performance.

### AWS Outposts

Outpost extend AWS infrasturcture by deployed Outpost racks into your own datacenter, effectively bring AWS cloud services on-premises.

### AWS Wavelength

Brings AWS services to the edge by leveraging 5G networks. This enables ultra-low latency applications by placing compute and storage resources closer to end users.

### AWS Local Zones

Allows AWS resources such as compute, database, storage, etc to be located closer to users in specific metropolitan areas like Boston, Dallas, Miami, and Chicago. This beneficial for latency-sensitive applications that require very fast local access. Currently supported in the United States.

## Key Takeaways

- AWS Route 53 allows to setup global DNS routing to direct user to closest deployment with minimal latency, helping disaster recovery strategies.
- CloudFront CDN integrates with Amazon S3 to replicate application data to AWS Edge locations, reducing latency and improve user experience using caching.
- S3 Transfer Acceleration and Global Accelerator leverages AWS Edge Locations and global network to enhance upload / download speeds and application availability.
- AWS Outposts, Wavelength, and Local Zones extend AWS infrastructure and services close to the users, provide ultra-low latency and local resources access for latency sensitive application.