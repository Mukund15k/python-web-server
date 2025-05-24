variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
  default = "secure-key"
}



variable "ecr_repo_name" {
  description = "Name of the AWS ECR repository"
  type        = string
  default     = "flask-cicd-project"
}