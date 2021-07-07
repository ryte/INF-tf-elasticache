variable "tags" {
  type        = map(string)
  description = "common tags to add to the ressources"
  default     = {}
}

variable "domain" {
  type        = string
  description = "the module creates a route53 domain entry and therefore need the domain in which the entry should be created"
}

variable "subnet_ids" {
  type        = list(string)
  description = "a list of subnet ids in which the ASG deploys to"
}

variable "hostname" {
  description = "hostname of the redis"
  default     = "redis"
}

variable "short_name_length" {
  description = "desired string length which is applied to various naming strings, to make the names shorter"
  default     = 4
}

variable "vpc_id" {
  type        = string
  description = "the VPC the ASG should be deployed in"
}

variable "csgs" {
  type        = list(string)
  description = "security groups which get added to the security group as ingress"
  default     = []
}

variable "application_port" {
  description = "port the service licenses to"
  default     = 6379
}

variable "node_type" {
  description = "type of machine to run on"
  default     = "cache.t2.small"
}

variable "engine_version" {
  description = "redis version to run"
  default     = "3.2.10"
}

variable "parameter_group_name" {
  description = "parameter group for the redis"
  default     = "default.redis3.2"
}

variable "environment" {
  type        = string
  description = "the environment this cache is running in (e.g. 'testing')"
}
