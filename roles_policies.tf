
resource "aws_iam_role" "role_ecs_app" {
  name               = "ecs-role"
  assume_role_policy = file("configs/ecs-role-assume.json")

}


resource "aws_iam_policy_attachment" "policy_attach_service" {
  name       = "policy-attachment_for_ecs"
  roles      = [aws_iam_role.role_ecs_app.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"

}

