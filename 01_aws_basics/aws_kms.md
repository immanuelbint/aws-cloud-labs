# AWS Key Management Service (KMS)

Anytime we hear "encryption" for AWS service, it's most likely to be KMS. AWS manages encryption keys for us, and it's fully integrated with IAM for authorization. It's make easy to control access to your data, we're able to audit KMS key usage using CloudTrail, and it's seamless integrated into most AWS services (EBS, S3, RDS, SSM, etc). Do not store your secret in plaintext, especially in your code. KMS key encryption also available through API calls (SDK, CLI), encrypted secrets can be stored in the code or environment variables.

## KMS key types

KMS keys is the new name of KMS Customer Master Key, there is 2 keys types available for now:

- Symmetric (AES-256 keys)
    - single encryption key that is used to Encrypt and Decrypt
    - AWS services that are integrated with KMS use Symmetric CMKs
    - you never get access to the KMS keys unencrypted (must call KMS API to use)
- Asymmetric (RSA & ECC key pairs)
    - public (encrypt) and Private Key (decrypt) pair
    - used for encrypt/decrypt, or sign/verify operations
    - the public key is downloadable, but you can't access the private key unencrypted
    - used for encryption outside the AWS by user who can't call the KMS API

- Types of KMS Keys:
    - AWS owned keys (free): SSE-S3, SSE-SQS, SSE-DDB, (default key)
    - AWS Managed key: free (aws/service-name, ex: aws/rds, aws/ebs)
    - Customer managed keys created in KMS: $1 per month
    - Customer managed keys imported: $1 per month

## KMS Key Policies

Control access to KMS keys "similar" to S3 bucket policies, the difference you cannot control access without them.

- Default KMS key policy:
    - Created if you don't provide a specific KMS key policy
    - Complete access to the key to the root user = entire AWS account
- Custom KMS key policy:
    - Define users, roles that can access the KMS key
    - Define who can administer the key
    - Useful for cross account access of your KMS key

## KMS Key Rotation

### KMS Automatic Key Rotation

- AWS managed KMS keys automatically rotated every 1 year
- For customer managed symmetric KMS key:
    - automatic key rotation is optionally enabled
    - customize rotation period between 90 and 2560 days (default 365 days)
    - previous key is kept active, so you can decrypt old data
    - new key has the same KMS key ID (only backing key is changed)

### KMS On Demand Key Rotation

- For Customer Managed Symmetric KMS key (not AWS managed CMK)
- Does not require Automatic Key rotation to be enabled
- Does not change existing automatic rotation schedules
- limit to how many times you can trigger an on demand key rotation

### KMS Manual Key Rotation (Customer Managed Symmetric KMS key & Imports)

- When you want to rotate key (example: every month)
- New key has a different KMS Key ID
- Keep the previous key active so you can decrypt old data
- Better to use aliases in this case (to hide the change of key for the application)
- Good solution to rotate KMS key that are not eligble for automatic rotation (like asymmetric KMS Key)

## KMS Key Deletion Considerations

- Schedule CMK for deletion with an waiting period of 7 to 30 days
    - CMK's status is "pending deletion" during the waiting period
- During the CMK's deletion waiting period
    - The CMK can't be used for cryptographic operations (e.g., can't decrypt KMS encrypted objects in S3 - SSE-KMS)
    - The key is not rotated even if planned
- You can cancel the key deletion during the waiting period
- Consider disabling your key instead of deleting it if not sure
