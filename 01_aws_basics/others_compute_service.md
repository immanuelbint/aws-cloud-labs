# AWS Other Compute Summary

### Docker

Container technology to run application, and it's can be run on multiple Operating System.

### Elastic Container Service (ECS)

Managed service by AWS, used to run Docker containers on EC2 instances.

### Fargate

Run on Docker containers without provisioning the infrastructure, and it's serverless (no EC2 instances)

### Elastic Container Registry (ECR)

Private Docker images repository

### Batch

Allows to run batch jobs on AWS across managed EC2 instances.

### Lightsail

Intended only for thoose who are new to Cloud computing, provides predictable and low pricing for simple application & Database stacks.

---

## Lambda Summary

Serverless Function as a Service, seamless scaling, and reactive

- Lambda billing are billed by the time run x by the RAM provisioned, and by the number of invocations
- Supports many programming languages except (arbitrary) Docker.
- Invocation time takes up to 15 minutes.
- Mainly used to create Thumbnails for images uploaded onto S3, run serverless cronjob, etc

API Gateway: expose Lambda function as HTTP API



## Key Takeaways

- Docker containers can be run on AWS using ECS with provisioned EC2 instances or Fargate without managing infrastructure.
- AWS Fargate offers a serverless way to run Docker containers transparently.
- AWS Batch runs batch jobs on managed EC2 instances and operates on top of ECS.
- LightSail provides a simple, predictable pricing service for applications and databases.
- AWS Lambda is a serverless function-as-a-service with seamless scaling and supports multiple programming languages.
- Lambda supports container images only if they implement the Lambda Runtime API; otherwise, ECS or Fargate is used.
- Lambda functions have a maximum invocation time of 15 minutes and are suitable for tasks like image processing or serverless cron jobs.
- API Gateway enables exposing Lambda functions as HTTP APIs with security and management features.