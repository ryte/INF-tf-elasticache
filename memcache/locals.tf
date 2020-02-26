locals {
  name = "${var.tags["Environment"]}-memcache-${var.hostname}"
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
