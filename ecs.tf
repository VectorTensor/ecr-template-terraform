
resource "aws_ecs_cluster" "my_stage_ecs_cluster" {
  name = "my-stage-ecs_cluster"
}

resource "aws_ecs_task_definition" "stage_task" {
  family             = "stage-task-family"
  execution_role_arn = aws_iam_role.ecs_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn
  network_mode       = "awsvpc"
  cpu                = "256"
  memory             = "512"

  container_definitions = jsonencode([{
    name      = "my-app-container"
    image     = aws_ecr_repository.stage_images.repository_url
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [
      {
        containerPort = 8000
        hostPort      = 8000
        protocol      = "tcp"
      }
    ]
  }])

}

resource "aws_ecs_service" "stage_service" {
  name            = "stage-service"
  cluster         = aws_ecs_cluster.my_stage_ecs_cluster.id
  task_definition = aws_ecs_task_definition.stage_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["subnet-0f7da863d6389517c"]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true

  }

}
# Output ECS cluster URL
output "ecs_cluster_name" {
  value = aws_ecs_cluster.my_stage_ecs_cluster.name
}


output "ecs_task_public_ip" {
  value       = aws_ecs_service.stage_service.network_configuration[0].assign_public_ip
  description = "The public IP of the ECS task."
}
