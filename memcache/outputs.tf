output "memcache_address" {
  value = aws_elasticache_cluster.memcache.cluster_address
}

output "database_fqdn" {
  value = aws_route53_record.record.fqdn
}

output "sg_intra" {
  value = aws_security_group.intra.id
}

output "sg" {
  value = aws_security_group.memcache.id
}

