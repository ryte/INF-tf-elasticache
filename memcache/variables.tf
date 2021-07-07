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
  description = "hostname of the memcache"
  default     = "memcache"
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
  default     = 11211
}

variable "instance_type" {
  description = "type of machine to run on"
  default     = "cache.t2.small"
}

variable "engine_version" {
  description = "memcache version to run"
  default     = "1.4.34"
}

variable "desired_clusters" {
  description = "amount of cluster members to spawn"
  default     = "2"
}

variable "az_mode" {
  description = "if the memcache should run in a single AZ oder cross multiple, valid arguments: `single-az` or `cross-az`"
  default     = "single-az"
}

variable "parameter_group_name" {
  description = "parameter group for the memcache"
  default     = "default.memcached1.4"
}

variable "environment" {
  type        = string
  description = "the environment this cache is running in (e.g. 'testing')"
}
