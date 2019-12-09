resource "aws_elasticache_subnet_group" "redis" {
  name       = var.hostname
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.hostname
  engine               = "redis"
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = "1"
  parameter_group_name = var.parameter_group_name
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids   = [aws_security_group.redis.id]
  maintenance_window   = "sun:02:30-sun:03:30"
  port                 = var.application_port
  tags                 = merge(local.tags)
}

resource "aws_security_group" "redis" {
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port       = var.application_port
    to_port         = var.application_port
    protocol        = "tcp"
    security_groups = concat(var.csgs, [aws_security_group.intra.id])
  }

  tags = merge(
    local.tags,
    {
      "Name" = "${local.name}-sg"
    },
  )
  vpc_id = var.vpc_id
}

resource "aws_security_group" "intra" {
  tags = merge(
    local.tags,
    {
      "Name" = "${local.name}-intra"
    },
  )
  vpc_id = var.vpc_id
}

