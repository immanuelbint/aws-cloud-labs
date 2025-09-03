# AWS Cloud Monitoring 

### CloudWatch

There are 4 CloudWatch features you could use

- Metrics: used to monitor performance of AWS services and billing metrics.
- Alarms: automate notification, perfrom EC2 action, notify to SNS based on metric.
- Logs: collect logs files from EC2 instances, servers, lambda functions.
- Events (or EventBridge): react to events in AWS, or trigger a rule on schedule (Cronjobs).

### CloudTrail

Audit API calls made within your AWS account.

### CloudTrail Insights

Automated analysis of your CloudTrail Events.

### X-Ray

Trace requests made through your distributed applications. Helpful for performance analysis or root cause analysis, especially when you have errors and all your applications are communicating with one another.

### AWS Health Dashboard

Check status of all AWS services across all regions.

### AWS Account Health Dashboard

Checks AWS events that may impact your infrastructure.

### Amazon CodeGuru

Automated code reviews and application performance recommendations.

## Key Takeaways

- CloudWatch provides multiple features including metrics monitoring, alarms, logs collection, and event handling.
- CloudTrail enables auditing of API calls with additional automated analysis through CloudTrail Insights.
- Amazon X-Ray assists in tracing requests across distributed applications for performance and root cause analysis.
- AWS Health Dashboards provide service status updates globally and account-specific event information.
- CodeGuru offers automated code reviews and application performance recommendations using machine learning.