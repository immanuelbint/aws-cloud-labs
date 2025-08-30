# Configure and Launch simple EC2 Instance

## Requirement
- AWS Account
- User that has permission to create and launch EC2 instance

## Step

1. Login to AWS Console
2. Press [Alt+S] to open search bar, and type EC2
3. Then click on Launch instance, enter name and tags for the instance
4. Select which OS flavour you'd like to use (it could be linux, windows, MAC, etc), but in this docs we're going to use default amazon linux
5. There are many instance type we could use, but for now choose t2.micro that eligble for free tier
6. In the Key pair section, choose on create new key pair, use RSA for key pair type, and for the format type use `.pem` (for linux, windows 10, 11), if you use windows 8 or below, choose `.ppk` to ssh via putty.
7. Network and storage we'll leave it default
8. In the advanced details scroll down until the `User data` section, then paste this script, it will be executed when the instance is first started

```bash
#!/bin/bash
# This script will be exectued only on first instance launch

# Install web server and adding index.html
yum update -y
yum install -y httpd

systemctl enable --now httpd

echo "Hello World, from $(hostname -f)" > /var/www/html/index.html
```

9. Finally click on review and launch instance, back to EC2 and click on Instance section, click on instance we have create before, and click on open address in Public IPv4 address, that's it, we have successfully create EC2 Instance that include a http website

## Reference

- AWS Udemy Course by Stephane Maarek
- [AWS official docs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)