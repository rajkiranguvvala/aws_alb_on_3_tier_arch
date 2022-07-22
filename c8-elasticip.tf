#Create Elastic IP for bastion host

resource "aws_eip" "bastion_eip" {
 depends_on = [
   module.ec2_public,module.onestopnews
 ]
  instance = module.ec2_public.id[0]
  vpc      = true
  tags = local.common_tags
}