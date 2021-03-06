# INF-tf-elasticache redis cluster

Terraform module for creating a aws elasticache redis cluster

NOTE: keep the names short, since the maximum length for the name is 20

NOTE: aws redis sdk needed to connect to the cluster

This project is [internal open source](https://en.wikipedia.org/wiki/Inner_source)
and currently maintained by the [INF](https://github.com/orgs/ryte/teams/inf).

## Module Input Variables

- `application_port`
    -  __description__: port the service licenses to
    -  __type__: `string`
    -  __default__: 6379

- `csgs`
    -  __description__: security groups which get added to the security group as ingress
    -  __type__: `list`
    -  __default__: []


- `domain`
    -  __description__: the module creates a route53 domain entry and therefore need the domain in which the entry should be created
    -  __type__: `string`

- `description`
    -  __description__: description which is beeing displayed in the console
    -  __type__: `string`
    -  __default__: ""

- `engine_version`
    -  __description__: redis version to run
    -  __type__: `string`
    -  __default__: "3.2.10"

- `environment`
    -  __description__: the environment this cache is running in (e.g. 'testing')
    -  __type__: `string`

- `hostname`
    -  __description__: hostname of the redis
    -  __type__: `string`
    -  __default__: "redis"


- `node_type`
    -  __description__: type of machine to run on
    -  __type__: `string`
    -  __default__: "cache.t2.small"


- `num_node_groups`
    -  __description__: Specify the number of node groups (shards) for this Redis replication group
    -  __type__: `string`
    -  __default__: 2

- `parameter_group_name`
    -  __description__: parameter group for the redis
    -  __type__: `string`
    -  __default__: "default.redis3.2.cluster.on"

- `replicas_per_node_group`
    -  __description__: SSpecify the number of replica nodes in each node group. Valid values are 0 to 5.
    -  __type__: `string`
    -  __default__: 1


- `short_name_length`
    -  __description__: desired string length which is applied to various naming strings, to make the names shorter
    -  __type__: `string`
    -  __default__: 4


- `subnet_ids`
    -  __description__: a list of subnet ids in which the ASG deploys to
    -  __type__: `list`


- `tags`
    -  __description__: a map of tags which is added to all supporting ressources
    -  __type__: `map`
    -  __default__: {}


- `vpc_id`
    -  __description__: the VPC the ASG should be deployed in
    -  __type__: `string`



## Usage

```hcl
module "redis_cluster" {
  source      = "github.com/ryte/INF-tf-elasticache//redis/cluster?ref=v0.2.2"
  tags        = local.common_tags
  environment = var.environment

  domain                  = var.domain
  engine_version          = "5.0.5"
  description             = "Redis Cluster"
  config_hostname         = "rediscluster"
  parameter_group_name    = "default.redis5.0.cluster.on"
  application_port        = 6379
  node_type               = "cache.t3.small"
  replicas_per_node_group = 1
  num_node_groups         = 2
  vpc_id                  = data.terraform_remote_state.vpc.vpc_id
  subnet_ids              = data.terraform_remote_state.vpc.subnet_private
  csgs                    = []
}
```

## Outputs

- `config_endpoint`
    -  __description__: cluster configuration endpoint (needed for aws redis sdk)
    -  __type__: `string`


- `database_fqdn`
    -  __description__: fqdn created from domain and hostname
    -  __type__: `string`


- `sg_intra` (DEPRECATED)
    -  __description__: an intra SG, intended to added to EC2 instsances for access
    -  __type__: `string`
  value = "${aws_security_group.intra.id"


- `sg`
    -  __description__: SG which is attached to the service
    -  __type__: `string`
