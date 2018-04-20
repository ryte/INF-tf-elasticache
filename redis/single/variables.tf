variable "cid" {}
variable "domain" {}
variable "environment" {}
variable "owner" {}
variable "project" {}

variable "subnet_ids" {
  type = "list"
}

variable "hostname" {
  default = "redis"
}

variable "short_name_length" {
  default = 4
}

variable "vpc_id" {}

variable "csgs" {
  type    = "list"
  default = []
}

variable "application_port" {
  default = 6379
}

variable "node_type" {
  default = "cache.t2.small"
}

variable "engine_version" {
  default = "3.2.10"
}

variable "parameter_group_name" {
  default = "default.redis3.2"
}