#AWS Ec2 Instance terraform module

module "ec2_private" {
    depends_on = [
      module.onestopnews
    ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  name = "${var.environment}-PrivateVM"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
   subnet_ids = [
    module.onestopnews.private_subnets[0],
    module.onestopnews.private_subnets[1]
    
  ]  

  #subnet_ids             = [module.onestopnews.private_subnets[0],module.onestopnews.private_subnets[1]]
  vpc_security_group_ids = [module.private_sg.this_security_group_id]
  #instance_count = var.private_instance_count

  instance_count         = var.private_instance_count


  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags
}

