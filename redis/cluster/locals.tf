locals {
  name = "${var.tags["Environment"]}-redis-${var.hostname}"
}

locals {
  short_name = substr(local.name, 0, min(20, length(local.name)))
  tags = merge(
    var.tags,
    {
      "Module" = "redis-cluster"
      "Name"   = local.name
    },
  )
}

