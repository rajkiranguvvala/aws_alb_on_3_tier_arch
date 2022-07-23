#AWS Ec2 Instance type
variable "instance_type" {
    description = "Ec2 instance type"
    type=string
    default = "t2.micro"
  
}

#AWS EC2 instance key pair
variable "instance_keypair" {
  description = "AWS Ec2 Instance key pair"
  type=string
  default = "onestopnews-ec2"
}

#AWS EC2 Private Instance count
variable "private_instance_count" {
  description = "AWS Ec2 private instance count"
  type=number
  default = 1
}