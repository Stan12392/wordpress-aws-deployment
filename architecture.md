# Architecture

## Components
- EC2 (Amazon Linux 2023, t3.micro): Apache (httpd), PHP, WordPress files in /var/www/html
- RDS MySQL: application database (not publicly accessible)
- Security group wordpress-web-sg: SSH (restricted IP), HTTP 80, HTTPS 443
- Security group wordpress-db-sg: MySQL 3306 only from wordpress-web-sg

## Request flow
1. Browser -> HTTP to EC2 public IP
2. Apache serves WordPress PHP
3. WordPress -> RDS endpoint on port 3306 for data

## Security choices
- Database has no public access
- Web tier and DB tier separated by security groups
- SSH key authentication (key file not stored in this repo)

## Cost control
- Stop EC2 when not in use
- Delete EC2 + RDS when the project is finished to avoid ongoing charges
