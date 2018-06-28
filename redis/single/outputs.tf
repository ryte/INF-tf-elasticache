output "address" {
  value = "${aws_elasticache_cluster.redis.cache_nodes.0.address}"
}

output "redis_fqdn" {
  value = "${aws_route53_record.record.fqdn}"
}

output "sg_intra" {
  value = "${aws_security_group.intra.id}"
}

output "sg" {
  value = "${aws_security_group.redis.id}"
}