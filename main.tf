terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

  }

  required_version = ">= 1.2.0"


}

provider "aws" {

  region = "us-east-1"

}

resource "aws_iam_role" "role_ecs_app" {
  name               = "ecs-role"
  assume_role_policy = file("configs/ecs-role-assume.json")

}


resource "aws_iam_policy_attachment" "policy_attach_service" {
  name       = "policy-attachment_for_ecs"
  roles      = [aws_iam_role.role_ecs_app.arn]
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"

}


