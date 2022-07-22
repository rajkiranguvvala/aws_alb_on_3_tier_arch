module "onestopnews" {
  source                             = "terraform-aws-modules/vpc/aws"
  version                            = "3.14.2"
  name                               = "${local.name}-${var.vpc_name}"
  cidr                               = var.vpc_cidr_block
  azs                                = var.vpc_availability_zones
  private_subnets                    = var.private_subnets
  public_subnets                     = var.vpc_public_subnets
  database_subnets                   = var.database_subnets
  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table
  #create_database_internet_gateway_route =true
  #create_database_nat_gateway_route =true    
  #NAT Gateway for outbound communications
  enable_nat_gateway = var.enable_nat_gateway

  #in Prod this will be false
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  public_subnet_tags = {
    Type = "public-subnets"
  }
  private_subnet_tags = {
    Type = "private-subnets"
  }
  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    Owner       = "Kiran"
    Environment = "dev"
  }

}
