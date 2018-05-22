variable "tags" {
  type = "map"
  description = "common tags to add to the ressources"
  default = {}
}
variable "domain" {}

variable "subnet_ids" {
  type = "list"
}

variable "config_hostname" {
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
  default = "default.redis3.2.cluster.on"
}

variable "replicas_per_node_group" {
  default = 1
}
variable "num_node_groups" {
  default = 2
}

variable "description" {
  default = ""
}