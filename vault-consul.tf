module "vault-consul" {
  source = "git@github.com:hashicorp/is-immutable-aws-vault-consul.git"

  # Private Local Account AMI filter
  ami_prefix     = "is-aws-immutable-vault-"
  ami_release    = "0.0.1"
  ami_os         = "centos"
  ami_os_release = "7"
  ami_owner      = "jeff.hemmen@ecs-digital.co.uk"

  # Public/Cross-Account Specific AMI ID(This overrides the above filter)
  ami_id = "ami-04344f4abdb2c3a93" # HashiCorp-provided

  instance_type = "m5.large"

  #Keep at 0.0.1/bootstrap=true during initial ACL Bootstrap/Vault Recovery Init
  #Then move both to 0.0.2 and set bootstrap to false
  consul_cluster_version = "0.0.3"
  vault_cluster_version  = "0.0.4"
  bootstrap              = false

  #SSH Key
  key_name           = var.key-name
  name_prefix        = "jeff-hcb-"
  vpc_id             = module.vpc.vpc_id
  subnets            = "subnet-bd8013cb,subnet-aa53f3f2,subnet-e5224381"
  availability_zones = "eu-west-1b,eu-west-1c,eu-west-1a"

  elb_internal          = false
  public_ip             = true
  allowed_inbound_cidrs = ["0.0.0.0/0"]

  vault_nodes       = "3"
  consul_nodes      = "5"   #You can use an even number when using redundancy zones
  redundancy_zones  = false #Currently has issues with UpgradeMigrations
  disaster_recovery = false #Adjusts health check for DR nodes

  owner = "jeff.hemmen@ecs-digital.co.uk"
  ttl   = "-1"

}
