module "event_driven_lambda" {
  source        = "git@github.com:moggiez/terraform-modules.git//event_driven_lambda"
  function_name = "${var.project_name}-event-driven"
  key           = "${var.project_name}-event-driven"
  s3_bucket     = aws_s3_bucket._
  timeout       = var.timeout
  dist_dir      = "../dist"
  policies = [
    aws_iam_policy.s3_access.arn,
    aws_iam_policy.cloudwatch_metrics_access.arn
  ]
}