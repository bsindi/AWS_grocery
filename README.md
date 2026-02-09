# 🚀 GroceryMate -- Production-Style AWS Cloud Infrastructure with Terraform

## ⭐ Overview

**GroceryMate** is a full-stack grocery e-commerce application deployed
on **AWS** using **Infrastructure as Code (Terraform)**.\
This project demonstrates how to design, deploy, and operate a modern
cloud application using **EC2, RDS, S3, IAM, Docker, SNS, and
Terraform**, following AWS best practices.

The project was completed as part of the **Masterschool AWS & Cloud
Engineering program**.

------------------------------------------------------------------------

## 🧠 Architecture Diagram

``` mermaid
flowchart LR
    User --> EC2
    EC2 --> RDS[(PostgreSQL RDS)]
    EC2 --> S3[(S3 Bucket)]
    CloudWatch --> SNS[(SNS Notifications)]
```

------------------------------------------------------------------------

## 🏗️ Architecture Overview

**Frontend** - React (served via EC2 / Docker)

**Backend** - Python (Flask) - Dockerized application

**Database** - Amazon RDS (PostgreSQL)

**Storage** - Amazon S3 for user avatar images

**Infrastructure Management** - Terraform (Infrastructure as Code)

**Security** - IAM Roles for EC2 - Security Groups for network access

------------------------------------------------------------------------

## ☁️ AWS Services Used

  Service                 Purpose
  ----------------------- -------------------------------------
  EC2                     Hosts Dockerized backend & frontend
  RDS (PostgreSQL)        Relational database
  S3                      Avatar image storage
  IAM                     Secure access via roles
  VPC & Security Groups   Networking & firewall rules
  **SNS**                 **Email notifications & alerting**
  Terraform               Infrastructure provisioning

------------------------------------------------------------------------

## 📂 Repository Structure

    AWS_grocery/
    ├── backend/
    ├── frontend/
    ├── infrastructure/
    │   ├── terraform/
    │   ├── terraform-s3/
    │   └── terraform-week9-sns/
    ├── README.md
    └── .gitignore

------------------------------------------------------------------------

## 🛠️ Terraform Deployment

``` bash
terraform init
terraform apply
```

------------------------------------------------------------------------

## 🔔 SNS Notifications (Week 9 Service)

As part of Week 9, **Amazon SNS** was implemented using Terraform.

### What was built:

-   SNS Topic
-   Email Subscription
-   Confirmed notification endpoint

### Why SNS?

SNS enables real-time alerting and integrates with services like
CloudWatch to notify operators about infrastructure events.

### Deployment

``` bash
terraform apply
```

### Proof of Functionality

-   Email subscription successfully confirmed\
-   Test notification delivered

This demonstrates a fully deployed and functioning AWS service.

------------------------------------------------------------------------

## 🪣 S3 Avatar Storage

``` bash
aws s3 cp backend/avatar/ s3://<bucket-name>/avatars/ --recursive
```

------------------------------------------------------------------------

## 🐳 Docker Run

``` bash
docker run -d -p 5000:5000 grocerymate
```

------------------------------------------------------------------------

## 🔐 Security Best Practices

-   Public S3 access fully blocked\
-   IAM roles used instead of access keys\
-   Security Groups restrict traffic where possible\
-   Sensitive variables excluded from Git\
-   Terraform used for consistent infrastructure provisioning

------------------------------------------------------------------------

## 📜 License

MIT License

## 👤 Author

**Barzan Sindi**
