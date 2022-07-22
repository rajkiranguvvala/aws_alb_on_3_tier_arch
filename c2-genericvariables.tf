variable "aws_region" {
    description = "region name in which aws resource to be created"
    type = string
    default = "us-east-1"
}

variable "environment"{
    description = "Environment variable used as prefix"
    type = string
    default = "dev"

}

variable "business_division" {
    description = "Business division in the organisation"
    type = string
    default = "SAP"
  
}