#File that contains list of ec2 outputs that can be used in this project


#Generate public instance Id
output "ec2_public_bastion_instance_id" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}

#ec2_bastion_public_ip
output "ec2_bastion_public_ip" {
    description = "list of public IP addresses assigned to the instances"
    value = module.ec2_public.public_ip
  
}



#Generate private instance Id
output "ec2_private_instacne_id" {
    description = "The ID of the instance"
    value = module.ec2_private.id
}

#ec2_private ip
output "ec2_private_ip" {
    description = "list of private IP addresses assigned to the instances"
    value = module.ec2_private.private_ip
          
}