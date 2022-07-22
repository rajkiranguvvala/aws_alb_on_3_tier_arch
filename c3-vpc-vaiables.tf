
variable "vpc_name" {
  default     = "myvpc"
  type        = string
  description = "VPC name"
}

variable "vpc_cidr_block" {
  description = "cidr block for vpc"
  default     = "10.0.0.0/16"
  type        = string

}

variable "vpc_public_subnets" {
  description = "public subnets for vpc"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets" {
  description = "private subnets for vpc"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "database_subnets" {
  type    = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]

}

variable "vpc_availability_zones" {
  description = "vpc availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]

}

variable "create_database_subnet_group" {
  type    = bool
  default = true

}

variable "create_database_subnet_route_table" {
  type    = bool
  default = true
}

variable "enable_nat_gateway" {
  description = "VPC create nat gateway for private subnets to communicate with internet"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "create only one nat gateway irrescpective of no of subnets"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "dns hostname "
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "enble dns support"
  type        = bool
  default     = true
}
