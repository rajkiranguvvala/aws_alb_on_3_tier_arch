#VPC ID
output "vpc_id" {
    description = "VPC id created"
    value = module.onestopnews.vpc_id
  
}

output "vpc_cidr_block" {
    description = "CIDR block "
    value = module.onestopnews.vpc_cidr_block
  
}

output "vpc_private_subnet" {
    description = "Private subnets"
    value = module.onestopnews.private_subnets
  
}

output "vpc_public_subnet" {

    description = "Public subnets"
    value = module.onestopnews.public_subnets
  
}


output "vpc_availability_zones" {

    description = "Availability zones in this VPC"
    value =module.onestopnews.azs
}