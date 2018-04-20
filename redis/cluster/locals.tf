locals {
  tags = {
    CID         = "${var.cid}"
    Environment = "${var.environment}"
    Module      = "redisCluster"
    Owner       = "${var.owner}"
    Project     = "${var.project}"
  }

  short_name = "${substr(var.environment, 0, var.short_name_length)}-${substr(var.project, 0, var.short_name_length)}-recl"
}

