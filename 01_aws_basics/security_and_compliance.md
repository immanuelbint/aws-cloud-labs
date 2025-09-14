# AWS Security and Compliance Summary

### AWS Shared Responsibility Model

AWS manages the security of the cloud infrastructure, while customers are responsible for securing their data and applications within the cloud.

### AWS Shield

Provides protection against Distributed Denial of Service (DDoS) attacks. Using Shield Advanced grants you access to 24/7 support for enhanced protection.

### Web Application Firewall (WAF)

WAF is a firewall that filters incoming web requests based on specific rules, helping to protect your applications from common web exploits.

### Key Management Service (KMS)

- KMS (Key Management Service): Manages your encryption keys on AWS.
- CloudHSM: Provides hardware encryption where you manage the encryption keys, while AWS manages the underlying hardware.

### AWS Certificate Manager (ACM)

Allows you to provision, manage, and deploy SSL and TLS certificates to enable in-flight encryption for your applications.

### AWS Artifact

Provides access to compliance reports such as PCI and ISO, helping you meet regulatory requirements.

### Threat Detection Service

- GuardDuty: Automatically detects malicious behavior by analyzing VPC logs, DNS logs, and CloudTrail logs.
- Inspector: Identifies software vulnerabilities in EC2 instances, ECR container images, and Lambda functions.
- Network Firewall: Protects your VPC against network attacks.

## Compliance and Data Protection Tools

- Config: Tracks configuration changes and creates rules to check resource compliance over time.
- Macie: Detects sensitive data, such as personally identifiable information (PII), in Amazon S3 buckets.

## Monitoring and Security Management

- CloudTrail: Tracks API calls made by users within AWS accounts.
- Security Hub: Aggregates security findings from multiple AWS services and accounts into a single dashboard for centralized management.
- Detective: Helps quickly identify the root cause of security findings by linking various services together.

## Abuse Reporting

Handles reports of abusive or illegal behavior involving AWS resources. Reports can be submitted via a form or email.

## Root User Capabilities

The root user in your AWS account has critical permissions, including:

- Change account settings
- Close AWS accounts
- Modifying or canceling support plans
- Register as a seller in the Reserved Instances marketplace

## IAM Access Analyzer

Identifies resources that are shared externally, outside of your trusted zone, helping you maintain secure access controls.

## Firewall Manager

Allows to manage security rules across your organization, including security groups, WAF, and Shield configurations.

## Logging in AWS for security and compliance

To help compliance requirement, AWS provides many service specific security and audit logs, service logs include :
- CloudTrails - trace all API calls made in AWS account
- Config Rules - for config & compliance over time
- CloudWatch Logs - for full data retention
- VPC Flow Logs - IP traffic within VPC
- ELB access logs - metadata of request made to your load balancers
- CloudFront logs - web distribution access logs
- WAF logs - full logging of all request analyzed by the service

Logs can be analyzed using AWS Athena if they stored in S3, it's recommend to encrypt logs in S3, and controll access using IAM & bucket policies, and MFA. Move logs to Glacier for cost savings.

## Key Takeaways

- The AWS Shared Responsibility Model outlines the division of security tasks between AWS and the user.
- AWS Shield provides automatic DDoS protection, with Shield Advanced offering 24/7 support.
- Services like WAF, KMS, CloudHSM, and ACM help manage security through firewalls, encryption keys, and certificates.
- Tools such as GuardDuty, Inspector, Config, Macie, CloudTrail, Security Hub, and Detective assist in threat detection, compliance, and incident investigation.