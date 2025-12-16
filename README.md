# 🛒 GroceryMate – AWS Cloud & Terraform Project

## ⭐ Overview
**GroceryMate** is a full-stack grocery e-commerce application deployed on **AWS** using **Infrastructure as Code (Terraform)**.  
This project demonstrates how to design, deploy, and operate a modern cloud application using **EC2, RDS, S3, IAM, Docker, and Terraform**, following AWS best practices.

The project was completed as part of the **Masterschool AWS & Cloud Engineering program**.

---

## 🏗️ Architecture Overview

**Frontend**
- React (served via EC2 / Docker)

**Backend**
- Python (Flask)
- Dockerized application

**Database**
- Amazon RDS (PostgreSQL)

**Storage**
- Amazon S3 for user avatar images

**Infrastructure Management**
- Terraform (Infrastructure as Code)

**Security**
- IAM Roles for EC2
- Security Groups for network access

---

## ☁️ AWS Services Used

| Service | Purpose |
|------|--------|
| EC2 | Hosts Dockerized backend & frontend |
| RDS (PostgreSQL) | Relational database |
| S3 | Avatar image storage |
| IAM | Secure access via roles |
| VPC & Security Groups | Networking & firewall rules |
| Terraform | Infrastructure provisioning |

---

## 📂 Repository Structure

```
AWS_grocery/
├── backend/
├── frontend/
├── infrastructure/
│   ├── terraform/
│   └── terraform-s3/
├── README.md
└── .gitignore
```

---

## 🛠️ Terraform Deployment

```bash
terraform init
terraform apply -auto-approve
```

---

## 🪣 S3 Avatar Storage

```bash
aws s3 cp backend/avatar/ s3://<bucket-name>/avatars/ --recursive
```

---

## 🐳 Docker Run

```bash
docker run -d -p 5000:5000 grocerymate
```

---

## 📜 License
MIT License

## 👤 Author
Barzan Sindi
