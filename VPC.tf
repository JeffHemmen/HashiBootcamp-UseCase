module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  # Required variables
  database_subnet_assign_ipv6_address_on_creation    = false
  elasticache_subnet_assign_ipv6_address_on_creation = false
  enable_classiclink                                 = false
  enable_classiclink_dns_support                     = false
  intra_subnet_assign_ipv6_address_on_creation       = false
  private_subnet_assign_ipv6_address_on_creation     = false
  public_subnet_assign_ipv6_address_on_creation      = false
  redshift_subnet_assign_ipv6_address_on_creation    = false

  # Networking
  cidr = "10.0.0.0/8"

  # Tagging
  tags = {
    "owner" = var.owner
    "project" = "HashiCorp IS Bootcamp Dec 2019"
  }
}
