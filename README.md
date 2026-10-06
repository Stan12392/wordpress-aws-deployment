# wordpress-aws-deployment

Production-style WordPress deployment on AWS.

## Architecture
- **EC2** (Amazon Linux 2023): Apache + PHP + WordPress
- **RDS MySQL**: application database (private access)
- **Security groups**:
  - `wordpress-web-sg`: SSH (my IP), HTTP 80, HTTPS 443
  - `wordpress-db-sg`: MySQL 3306 only from `wordpress-web-sg`
- WordPress connects to RDS by endpoint (not localhost)

## What I configured
- EC2 instance with key pair and web security group
- RDS MySQL instance with restricted security group
- Apache (`httpd`) and PHP on EC2
- WordPress files in `/var/www/html`
- Database `wordpress` created on RDS
- WordPress installer completed and site reachable on EC2 public IP

## Backup notes
- RDS automated backups enabled
- For files: snapshot the EC2 volume or copy `/var/www/html` to S3 before teardown

## Security notes
- DB not publicly accessible
- SSH limited to my IP
- Secrets (DB password, `.pem`, `wp-config.php`) are not stored in this repo
