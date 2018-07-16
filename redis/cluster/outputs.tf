output "config_endpoint" {
  value = "${aws_elasticache_replication_group.redis.configuration_endpoint_address }"
}

output "database_fqdn" {
  value = "${aws_route53_record.record.fqdn}"
}

output "sg_intra" {
  value = "${aws_security_group.intra.id}"
}

output "sg" {
  value = "${aws_security_group.redis.id}"
}