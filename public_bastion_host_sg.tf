

module "public_bastion_host_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 3 required variables here
  name        = "public-bastion-host-sg"
  description = "public bastion host security group with ssh open to internet"
  vpc_id      = module.onestopnews.vpc_id
  #Ingress rule
  ingress_rules        = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  #Egress rule
  egress_rules = ["all-all"]
  tags         = local.common_tags

}
