locals {
  name = "${var.tags["Environment"]}-redis-${var.name}"
}

locals {
  short_name = "${substr("${local.name}", 0, min(20, length(local.name)))}",
  tags = "${merge(
    var.tags,
    map(
      "Module", "memcached",
      "Name", "${local.name}"
    )
  )}"
}
