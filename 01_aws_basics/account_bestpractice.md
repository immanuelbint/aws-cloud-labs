# AWS Account Best Practices Summary

- Use **Organization** if operate multiple accounts.
- Use Service Control Policies (SCP) to restrict account power.
- To setup multiple accounts with best-practice easily, use **AWS Control Tower**.
- **Use Tags and Allocation Tags** for easy management and billing.
- **IAM guidelines** MFA, least-privilege, password policy and rotation.
- **Config** to record all resources configs and compliance over time.
- **CloudFormation** to deploy stacks across accounts and regions.
- **Trusted Advisor** to get insight, support plan based on your needs.
- Send service logs and access logs to Amazon S3 or CloudWatch Logs.
- **CloudTrail** to record API calls made within your account.
- If AWS account is compromised, change root password, delete and rotate all password / keys and contact AWS supports immediately.
- Allows user to create pre-defined stacks defined by admin using **AWS Service Catalog**

## Key Takeaways

- Use AWS Organizations to operate multiple accounts efficiently.
- Apply Service Control Policies (SCP) to restrict account permissions.
- Utilize AWS Control Tower for easy setup of multiple accounts with best security practices.
- Implement IAM guidelines such as enabling MFA, least privilege, password policies, and rotation.