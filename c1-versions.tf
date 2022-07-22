#terrafrom block
terraform {
required_version ="~> 1.2.5"
required_providers {
     aws ={
        source ="hashicorp/aws"
        version = "~> 3.0" 
     }
}
}

#providers 
provider "aws" {
    region =var.aws_region
    profile="default"
}
