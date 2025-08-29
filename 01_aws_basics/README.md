# **Cloud Computing**

## What is Cloud Computing?

Cloud computing is the delivery of on-demand IT resources and services, such as servers, storage, databases, networking, software, and analytics, over the internet to offer flexibility, scalability, and pay-as-you-go pricing. In this docs we're going to discuss mainly about AWS.

---

## Type Cloud Deployment Models

- Private Cloud: Used by a single organization and not exposed to the public. Providers like Rackspace manage these clouds. You have complete control and enhanced security for sensitive applications.
- Public Cloud: Resources are owned and operated by third-party providers such as Amazon Web Services (AWS), Google Cloud (GCP), and Microsoft Azure. These resources are delivered over the Internet.
- Hybrid Cloud: Combination of Private Cloud and Public Cloud. This allows control over sensitive assets in private infrastructure while benefiting from the flexibility and cost-effectiveness of the public cloud.

---

## Problem Solved by Cloud Computing

- Greater flexibility
- Cost effectiveness
- Scalability to add resources as needed
- Elasticity to scale out and in
- High availability and fault tolerance by relying on multiple data centers worldwide
- Agility to rapidly develop, test, and launch software applications

---

# AWS Cloud Overview

## AWS Global Infrastructure

AWS is global, consisting of regions, availability zones, data centers, edge locations, and points of presence. These are represented on an interactive map on the AWS website. AWS has multiple regions worldwide. Each region is connected through a private AWS network. Within each region, there are availability zones represented by blue dots. AWS's global infrastructure allows applications to be global by leveraging the cloud provider's infrastructure.

---

## AWS Console Overview

AWS has global services such as IAM, Route 53, CloudFront, and WAF. Most AWS services are region-scoped, including Amazon EC2, Elastic Beanstalk, Lambda, and Rekognition. To check if a service is available in your region, you should consult the region table provided in the AWS console.

---

## Keywords
- Elasticity: ability to automatically scale resources up/down.
- Pay-as-you-go: pay only for what you use.
- Availability Zone (AZ): isolated data center within a region.

---

## Quick Practice
```bash
# Check your AWS CLI is configured
aws configure list

# List all available regions
aws ec2 describe-regions --query "Regions[].RegionName"
```

---