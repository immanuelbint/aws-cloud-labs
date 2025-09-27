# AWS Lambda Automation Lab

In this hands-on lab, I’m practicing how to use AWS Lambda for automation. I’ll create Lambda functions, attach event triggers, and monitor logs to understand serverless workflows.

## Architecture Diagram

(example flow: S3 → Lambda → SNS)

## Requirements

- AWS Account
- User with permissions to:
    - Create Lambda functions
    - Create IAM roles for Lambda execution
    - Configure event sources (e.g., S3, CloudWatch Events)
    - Access CloudWatch Logs

## Objectives

- Create a basic Lambda function
- Attach IAM role for execution permissions
- Configure event triggers (S3 upload, CloudWatch schedule, or API Gateway)
- Validate execution and view logs in CloudWatch

## Step 1: Create Lambda Function

TBA

## Step 2: Add Event Trigger

TBA

## Step 3: Test the Function

TBA

## Step 4: Monitor with CloudWatch Logs

TBA

## Lesson Learned

- Lambda enables event-driven automation without managing servers
- Always attach the least-privilege IAM role to Lambda
- Event sources (S3, EventBridge, API Gateway, DynamoDB Streams) make Lambda powerful
- CloudWatch Logs are critical for debugging and monitoring Lambda executions
- Keep functions lightweight; split logic into multiple Lambdas for scalability

## References

- AWS Official Docs: [Getting Started with Lambda](https://docs.aws.amazon.com/lambda/latest/dg/getting-started.html)
- AWS Lambda Blueprints in Console