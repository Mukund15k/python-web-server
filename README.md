# Flask CI/CD Project with Jenkins, Terraform, Ansible, and AWS

## Overview

This project demonstrates a complete CI/CD pipeline for a Flask app using:

- Jenkins pipeline to build, push Docker image to AWS ECR, and deploy on EC2.
- Terraform to provision AWS infrastructure (VPC, EC2, ECR).
- Ansible for EC2 hardening.
- Docker to containerize Flask app.

## Folder Structure

project-root/
├── ansible/
│ └── hardening.yml
├── docker/
│ └── Dockerfile
├── flask-app/
│ ├── app.py
│ └── requirements.txt
├── jenkins/
│ └── Jenkinsfile
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── README.md



## Setup Instructions

1. Create an AWS key pair and save private key locally.
2. Update Terraform variables with key pair name and public key path.
3. Run `terraform init` and `terraform apply` to provision infrastructure.
4. Use Ansible playbook to harden the EC2 instance.
5. Configure Jenkins with AWS credentials and SSH key.
6. Run Jenkins pipeline to deploy Flask app.
7. Access Flask app at `http://65.0.76.159/`

---

---

---

