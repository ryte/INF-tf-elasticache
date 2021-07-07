# INF-tf-elasticache redis single

Terraform module for creating a aws elasticache redis single

NOTE: keep the names short, since the maximum length for the name is 20

This project is [internal open source](https://en.wikipedia.org/wiki/Inner_source)
and currently maintained by the [INF](https://github.com/orgs/ryte/teams/inf).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

The following requirements are needed by this module:

- terraform (>= 0.12)

## Providers

The following providers are used by this module:

- aws

## Required Inputs

The following input variables are required:

### domain

Description: the module creates a route53 domain entry and therefore need the domain in which the entry should be created

Type: `string`

### environment

Description: the environment this cache is running in (e.g. 'testing')

Type: `string`

### subnet\_ids

Description: a list of subnet ids in which the ASG deploys to

Type: `list(string)`

### vpc\_id

Description: the VPC the ASG should be deployed in

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### application\_port

Description: port the service licenses to

Type: `number`

Default: `6379`

### csgs

Description: security groups which get added to the security group as ingress

Type: `list(string)`

Default: `[]`

### engine\_version

Description: redis version to run

Type: `string`

Default: `"3.2.10"`

### hostname

Description: hostname of the redis

Type: `string`

Default: `"redis"`

### node\_type

Description: type of machine to run on

Type: `string`

Default: `"cache.t2.small"`

### parameter\_group\_name

Description: parameter group for the redis

Type: `string`

Default: `"default.redis3.2"`

### short\_name\_length

Description: desired string length which is applied to various naming strings, to make the names shorter

Type: `number`

Default: `4`

### tags

Description: common tags to add to the ressources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### address

Description: cluster adress

### redis\_fqdn

Description: fqdn created from domain and hostname

### sg

Description: SG which is attached to the service

### sg\_intra

Description: an intra SG, intended to added to EC2 instsances for access (DEPRECATED)

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Usage

```hcl
module "redis" {
  source      = "github.com/ryte/INF-tf-elasticache//redis/single?ref=v0.2.2"
  tags        = local.common_tags
  environment = var.environment

  domain               = local.domain
  engine_version       = "5.0.5"
  parameter_group_name = "default.redis5.0"
  application_port     = 6379
  node_type            = "cache.t3.small"
  hostname             = "redis"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  subnet_ids = data.terraform_remote_state.vpc.outputs.subnet_private

  csgs = [
    data.terraform_remote_state.ecs.outputs.ecs_cluster_sg,
  ]
}
```
