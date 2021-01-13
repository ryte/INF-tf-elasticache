data "aws_route53_zone" "zone" {
  name = "${var.domain}."
}

resource "aws_route53_record" "record" {
  name = "${var.hostname}.${var.domain}."

  records = [
    aws_elasticache_cluster.redis.cache_nodes[0].address,
  ]

  ttl     = "60"
  type    = "CNAME"
  zone_id = data.aws_route53_zone.zone.id
}
