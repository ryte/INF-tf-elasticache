# INF-tf-elasticache memcache

Terraform module for creating a aws elasticache memcache

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

Default: `11211`

### az\_mode

Description: if the memcache should run in a single AZ oder cross multiple, valid arguments: `single-az` or `cross-az`

Type: `string`

Default: `"single-az"`

### csgs

Description: security groups which get added to the security group as ingress

Type: `list(string)`

Default: `[]`

### desired\_clusters

Description: amount of cluster members to spawn

Type: `string`

Default: `"2"`

### engine\_version

Description: memcache version to run

Type: `string`

Default: `"1.4.34"`

### hostname

Description: hostname of the memcache

Type: `string`

Default: `"memcache"`

### instance\_type

Description: type of machine to run on

Type: `string`

Default: `"cache.t2.small"`

### parameter\_group\_name

Description: parameter group for the memcache

Type: `string`

Default: `"default.memcached1.4"`

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

### database\_fqdn

Description: fqdn created from domain and hostname

### memcache\_address

Description: cluster adress

### sg

Description: SG which is attached to the service

### sg\_intra

Description: an intra SG, intended to added to EC2 instsances for access (DEPRECATED)

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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
