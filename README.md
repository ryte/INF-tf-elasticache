# INF-tf-elasticache

Terraform module for creating a aws elasticache
currently available settings
- [memcache](memcache/README.md)
- [redis single node](redis/single/README.md)
- [redis cluster](redis/cluster/README.md)


This project is [internal open source](https://en.wikipedia.org/wiki/Inner_source)
and currently maintained by the [INF](https://github.com/orgs/ryte/teams/inf).

## Authors

- [Armin Grodon](https://github.com/x4121)
- [Markus Schmid](https://github.com/h0raz)

## Changelog

- 0.2.3 - fix typo in variable name in `memcache`
- 0.2.2 - Add variable `environment` instead of reading from tags
- 0.2.1 - fix cluster security groups
- 0.2.0 - Upgrade to terraform 0.12.x
- 0.1.1 - fix cluster security groups
- 0.1.0 - Initial release.

## License


This software is released under the MIT License (see `LICENSE`).
