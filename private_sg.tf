

module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 3 required variables here
  name        = "private-sg"
  description = "private sg with ssh and tcp  "
  vpc_id      = module.onestopnews.vpc_id
  #Ingress rule
  ingress_rules        = ["ssh-tcp","http-80-tcp"]
  ingress_cidr_blocks = [module.onestopnews.vpc_cidr_block]

  #Egress rule
  egress_rules = ["all-all"]
  tags         = local.common_tags

}
