locals {
  name = "${var.environment}-memcache-${var.name}"
}

locals {
  short_name = substr(local.name, 0, min(20, length(local.name)))
  tags = merge(
    var.tags,
    {
      "Module" = "memcached"
      "Name"   = local.name
    },
  )
}

