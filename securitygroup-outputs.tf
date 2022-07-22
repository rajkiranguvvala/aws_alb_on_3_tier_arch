#public security group outputs

output "public_bastion_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_host_sg.this_security_group_id
}

output "public_bastion_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_host_sg.this_security_group_vpc_id
}



output "public_bastion_security_group_name" {
  description = "The name of the security group"
  value       = module.public_bastion_host_sg.this_security_group_name
}


#private security groups outputs
output "private_bastion_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_sg.this_security_group_id
}

output "private_bastion_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_sg.this_security_group_vpc_id
}

output "private_bastion_security_group_name" {
  description = "The name of the security group"
  value       = module.private_sg.this_security_group_name
}

