variable "timeout" {
  type    = number
  default = 10
}

variable "domain_name" {
  type    = string
  default = "moggies.io"
}

variable "project_name" {
  type    = string
  default = "http_worker_result_archiver"
}

variable "account" {
  type    = string
  default = "989665778089"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "eventbus_name" {
  type    = string
  default = "moggiez-load-test"
}

variable "event_types" {
  type    = list(string)
  default = ["Worker Request Success", "Worker Request Failure"]
}