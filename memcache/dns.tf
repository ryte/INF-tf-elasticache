data "aws_route53_zone" "zone" {
  name = "${var.domain}."
}

resource "aws_route53_record" "record" {
  name = "${var.hostname}.${var.domain}."

  records = [
    "${aws_elasticache_cluster.memcache.cluster_address}"
  ]

  ttl     = "60"
  type    = "CNAME"
  zone_id = "${data.aws_route53_zone.zone.id}"
}
