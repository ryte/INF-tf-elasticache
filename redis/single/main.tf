resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.short_name != "" ? substr(var.short_name, 0, min(20, length(var.short_name))) : local.short_name}"
  subnet_ids = ["${var.subnet_ids}"]
  #tags       = "${merge(local.tags, map("Name", "${var.project}-${var.environment}-subnet-group-redis"))}"
}

resource "aws_elasticache_cluster" "redis" {

  cluster_id             = "${var.short_name != "" ? substr(var.short_name, 0, min(20, length(var.short_name))) : local.short_name}"
  engine                 = "redis"
  engine_version         = "${var.engine_version}"
  node_type              = "${var.node_type}"
  num_cache_nodes        = "1"
  parameter_group_name   = "${var.parameter_group_name}"
  subnet_group_name      = "${aws_elasticache_subnet_group.redis.name}"
  security_group_ids     = ["${aws_security_group.redis.id}"]
  maintenance_window     = "sun:02:30-sun:03:30"
  port                   = "${var.application_port}"
  tags                   = "${merge(local.tags, map("Name", "${var.project}-${var.environment}-redis"))}"

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

  tags   = "${merge(local.tags, map("Name", "${var.project}-${var.environment}-redis-sg"))}"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group" "intra" {
  tags   = "${merge(local.tags, map("Name", "${var.project}-${var.environment}-redis-intra"))}"
  vpc_id = "${var.vpc_id}"
}
