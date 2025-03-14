

resource "aws_ecr_repository" "stage_images" {

  name         = "stage-images"
  force_delete = true


}

data "aws_ecr_authorization_token" "token" {}

output "ecr_repository_url" {

  value = aws_ecr_repository.stage_images.repository_url

}


