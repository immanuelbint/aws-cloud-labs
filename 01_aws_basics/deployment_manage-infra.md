# AWS - Managing Infrastructure at Scale

## Deployment Summary

### CloudFormation (AWS only)

Infrastructure as a Code, works with almost all of AWS resources, can be repeated across Regions & Accounts

### Elastic Beanstalk (AWS only)

Platform as a Service (PaaS), limited to certain amount of programming languages or Docker, can deploy code consistently with a known architecture: ex, ALB + EC2 + RDS

### CodeDeploy (hybrid)

CodeDeploy allows you to deploy and upgrade any applications onto servers. This can be done on AWS, for example, on your EC2 instances, but it also supports deployment on your on-premises infrastructure. This capability makes it a hybrid type of service.

### System Manager (hybrid)

Systems Manager is another hybrid service that allows you to patch, configure, and run commands at scale across all your servers.

## Developer Service Summary

- CodeCommit: Unfortunately codecommit are discontinued in AWS service now, but it's a private Git repository services that provides version controlled code storage.
- CodeBuild: Allows build and test your code in AWS and is serverless.
- CodeDeploy: Allows to deploy code onto servers.
- CodePipeline: Orchestrates a pipeline within AWS, managing the flow from your code to build, test, deployment, provisioning, just like CI/CD.
- CodeArtifact: Used to stores software packages and dependencies on AWS.
- AWS Cloud Development Kit (CDK): Allows to define cloud infrastructure using programming languages such as JavaScript, TypeScript, Java, Python, etc. The code will be compiled into CloudFormation template.

## Key Takeaways

- AWS CloudFormation enables Infrastructure as Code for repeatable deployments across regions and accounts.
- Elastic Beanstalk provides a Platform as a Service for deploying applications with predefined architectures.
- CodeDeploy supports application deployment on both AWS and on-premises servers, enabling hybrid environments.
- Developer tools like CodeCommit, CodeBuild, CodePipeline, CodeArtifacts, and CDK facilitate code management, building, testing, deployment, and infrastructure definition.