output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "ecr_repository_url" {
  value = aws_ecr_repository.repo.repository_url
}
