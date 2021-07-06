output "address" {
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
  description = "cluster adress"
}

output "redis_fqdn" {
  value       = aws_route53_record.record.fqdn
  description = "fqdn created from domain and hostname"
}

output "sg_intra" {
  value       = aws_security_group.intra.id
  description = "an intra SG, intended to added to EC2 instsances for access (DEPRECATED)"
}

output "sg" {
  value       = aws_security_group.redis.id
  description = "SG which is attached to the service"
}
