provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "new_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "new_subnet" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.new_vpc.id
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.new_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.new_subnet.id
  route_table_id = aws_route_table.r.id
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.new_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask app"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "app_server" {
  ami                         = "ami-0e35ddab05955cf57"
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.new_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh_http.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "FlaskAppServer"
  }
}

resource "aws_ecr_repository" "repo" {
  name = var.ecr_repo_name
}
