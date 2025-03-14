
resource "null_resource" "build_push_docker" {
  depends_on = [aws_ecr_repository.stage_images]

  provisioner "local-exec" {
    command = <<EOT
      # Authenticate Docker with AWS ECR
      aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${aws_ecr_repository.stage_images.repository_url}

      cd source
      # Build the Docker image
      docker build -t test-fastapi-app .

      # Tag the image
      docker tag test-fastapi-app:latest ${aws_ecr_repository.stage_images.repository_url}:latest

      # Push the image to ECR
      docker push ${aws_ecr_repository.stage_images.repository_url}:latest
    EOT
  }
}
