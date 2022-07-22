
#AWS Ec2 Instance terraform module
#Bastion host that will be created in VPC public subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  name = "${var.environment}-Bastionhost"

  ami                    = data.aws_ami.amzlinux2.id
  #aws_ami.amzlinux2.ID
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.onestopnews.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_host_sg.this_security_group_id]
  tags = local.common_tags

}


