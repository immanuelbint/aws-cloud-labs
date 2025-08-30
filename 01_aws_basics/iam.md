# Identity and Access  Management (IAM)

It's a global service because in IAM we could do such as create users, groups, roles, etc.

## IAM Policies
IAM Policies consist of

- Version: policy language version, always include "2012-10-17"
- Id: an identifier for the policy (optional)
- Statement: one or more individual statements (required)

Each statements consists of

- Sid: an identifier for statement (optional)
- Effect: whether the statement allows or denies access (Allow, Deny)
- Principal: account/user/role to which this policy applied to
- Action: list of actions this policy allows or denies
- Resource: list of resources to which the actions applied
- Condition: conditions for when this policy is in effect (optional)

## IAM Summary

- Users are mapped to a physical user, it has a password for AWS Console.
- Groups only contains users.
- Policies are JSON docs that outlines permission for users and groups.
- Roles are intended for EC2 instances or AWS services.
- For the best practice, always use Multi Factor Authentication (MFA) + Strong password policy.
- AWS CLI used to manage your AWS service using command line interface.
- AWS SDK manage your AWS services using programming language.
- Access Keys and Access ID are used to access AWS using CLI / SDK.
- Audit IAM Credentials Report (account level) and IAM Access Advisor (user level).