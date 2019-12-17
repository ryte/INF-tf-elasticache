data "aws_availability_zones" "available" {}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.hostname}"
  subnet_ids = ["${var.subnet_ids}"]
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "${var.hostname}"
  replication_group_description = "${var.description}"
  node_type                     = "${var.node_type}"
  engine_version                = "${var.engine_version}"
  port                          = "${var.application_port}"
  parameter_group_name          = "${var.parameter_group_name}"
  security_group_ids            = ["${aws_security_group.redis.id}"]
  automatic_failover_enabled    = true
  subnet_group_name             = "${aws_elasticache_subnet_group.redis.name}"
  cluster_mode {
    replicas_per_node_group     = "${var.replicas_per_node_group}"
    num_node_groups             = "${var.num_node_groups}"
  }
}


resource "aws_security_group" "redis" {

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port       = "${var.application_port}"
    to_port         = "${var.application_port}"
    protocol        = "tcp"
    security_groups = ["${var.csgs}", "${aws_security_group.intra.id}"]
  }

  tags   = "${merge(local.tags, map("Name", "${local.name}-sg"))}"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group" "intra" {
  tags   = "${merge(local.tags, map("Name", "${local.name}-intra"))}"
  vpc_id = "${var.vpc_id}"
}
