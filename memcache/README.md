# INF-tf-elasticache memcache

Terraform module for creating a aws elasticache memcache

NOTE: keep the names short, since the maximum length for the name is 20

This project is [internal open source](https://en.wikipedia.org/wiki/Inner_source)
and currently maintained by the [INF](https://github.com/orgs/ryte/teams/inf).

## Module Input Variables

- `application_port`
    -  __description__: port the service licenses to
    -  __type__: `string`
    -  __default__: 11211


- `az_mode`
    -  __description__: if the memcache should run in a single AZ oder cross multiple, valid arguments: "single-az" or "cross-az"
    -  __type__: `string`
    -  __default__: "single-az"


- `csgs`
    -  __description__: security groups which get added to the security group as ingress
    -  __type__: `list`
    -  __default__: []


- `desired_clusters`
    -  __description__: amount of cluster members to spawn
    -  __type__: `string`
    -  __default__: 2


- `domain`
    -  __description__: the module creates a route53 domain entry and therefore need the domain in which the entry should be created
    -  __type__: `string`

- `engine_version`
    -  __description__: memcache version to run
    -  __type__: `string`
    -  __default__: "1.4.34"

- `environment`
    -  __description__: the environment this cache is running in (e.g. 'testing')
    -  __type__: `string`

- `hostname`
    -  __description__: hostname of the memcache
    -  __type__: `string`
    -  __default__: "memcache"


- `instance_type`
    -  __description__: type of machine to run on
    -  __type__: `string`
    -  __default__: "cache.t2.small"


- `parameter_group_name`
    -  __description__: parameter group for the memcache
    -  __type__: `string`
    -  __default__: "default.memcached1.4"


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
module "memcache" {
  source      = "github.com/ryte/INF-tf-elasticache//memcache?ref=v0.2.2"
  tags        = local.common_tags
  environment = var.environment

  domain               = var.domain
  hostname             = "memcache"
  desired_clusters     = 1
  az_mode              = "cross-az"
  engine_version       = "1.5.16"
  parameter_group_name = "default.memcached1.5"
  application_port     = 11211
  instance_type        = "cache.t3.small"
  vpc_id               = data.terraform_remote_state.vpc.vpc_id
  subnet_ids           = data.terraform_remote_state.vpc.subnet_private
  csgs                 = []
}
```

## Outputs

- `memcache_address`
    -  __description__: cluster adress
    -  __type__: `string`


- `database_fqdn`
    -  __description__: fqdn created from domain and hostname
    -  __type__: `string`


- `sg_intra` (DEPRECATED)
    -  __description__: an intra SG, intended to added to EC2 instsances for access
    -  __type__: `string`

- `sg`
    -  __description__: SG which is attached to the service
    -  __type__: `string`
