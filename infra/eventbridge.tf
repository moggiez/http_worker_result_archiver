module "http_worker_result_archiver_source_to_log_group" {
  source        = "git@github.com:moggiez/terraform-modules.git//eventrules_source_to_log_group"
  application   = var.domain_name
  account       = var.account
  eventbus_name = var.eventbus_name
  event_source  = var.eventbus_name
  log_group     = aws_cloudwatch_log_group._
}

module "event_type_to_lambda" {
  for_each      = toset(var.event_types)
  source        = "git@github.com:moggiez/terraform-modules.git//eventrules_detail_type_to_lambda"
  application   = var.domain_name
  name          = "${replace(each.value, " ", "-")}-to-${var.project_name}"
  account       = var.account
  region        = var.region
  detail_type   = each.value
  eventbus_name = var.eventbus_name
  lambda        = module.event_driven_lambda.lambda
}
