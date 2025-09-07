#!/bin/bash
# This script will be exectued only on first instance launch

# Install web server and adding index.html
yum update -y
yum install -y httpd

systemctl enable --now httpd

echo "Hello World, from $(hostname -f)" > /var/www/html/index.html