variable "cid" {}
variable "domain" {}
variable "environment" {}
variable "owner" {}
variable "project" {}

variable "subnet_ids" {
  type = "list"
}

variable "hostname" {
  default = "memcache"
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
  default = 11211
}

variable "instance_type" {
  default = "cache.t2.small"
}

variable "engine_version" {
  default = "1.4.34"
}

variable "desired_clusters" {
  default = "2"
}

variable "az_mode" {
  default = "single-az",
  description ="should be 'single-az' or 'cross-az'"
}

variable "parameter_group_name" {
  default = "default.memcached1.4"
}