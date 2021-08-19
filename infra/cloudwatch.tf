resource "aws_cloudwatch_log_group" "_" {
  name = "/aws/events/${var.domain_name}_${var.project_name}"
}
