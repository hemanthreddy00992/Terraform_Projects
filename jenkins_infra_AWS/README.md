# Jenkins infra creation using terraform in AWS cloud

This repository contains Terraform configurations for setting up a complete AWS infrastructure, including a Virtual Private Cloud (VPC), subnets, internet gateway (IGW), route tables, EC2 instances, Application Load Balancer (ALB), target groups, and Jenkins installation. The project is designed in a modular format, with state management handled using an S3 bucket and DynamoDB.

<img width="941" alt="Screenshot 2024-12-08 at 1 13 51 PM" src="https://github.com/user-attachments/assets/3901bb1c-6cd3-45f5-af45-9417bd90391a">



---

## Project Overview

### Components Created
1. **VPC**: A custom VPC with defined CIDR blocks.
2. **Subnets**: Two public and two private subnets across different availability zones for high availability.
3. **Internet Gateway (IGW)**: Facilitates internet access for resources in public subnets.
4. **Route Tables**: Configured to manage traffic flow between subnets and external networks.
5. **EC2 Instances**: Instances deployed in public subnets for running Jenkins.
6. **Application Load Balancer (ALB)**: Distributes incoming traffic across EC2 instances.
7. **Target Groups**: Configured to route traffic to healthy EC2 instances.
8. **Jenkins Installation**: Automated installation of Jenkins on EC2 instances via user data script.
9. **Backend**: Terraform state is stored in an S3 bucket, with DynamoDB for state locking.

### Modular Design
The infrastructure is built using a **modular approach** to enhance reusability and manageability. The key modules include:
- `vpc`: Handles the creation of VPC, subnets, IGW, and route tables.
- `ec2`: Manages EC2 instances and their configurations.
- `alb`: Sets up the Application Load Balancer and associated target groups.

---


## Backend Configuration

Terraform state is managed using:
- **S3 Bucket**: Secure storage for state files.
- **DynamoDB**: Ensures state locking and consistency for multi-user environments.

Configure the backend in `backend.tf`:
```hcl
terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "terraform.tfstate"
    region         = ""
    dynamodb_table = "terraform-lock"
  }
}
```

---

## How to Use

### Steps
1. Clone the repository:
   ```bash
    git clone "repo"
    cd repo
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Validate the configuration:
   ```bash
   terraform validate
   ```
4. Validate the configuration:
   ```bash
   terraform plan
   ```
5. Apply the configuration:
   ```bash
   terraform apply
   ```
6. Access Jenkins:
   - Once deployed, navigate to the public IP of the EC2 instance or the DNS of the ALB to access Jenkins.

---
