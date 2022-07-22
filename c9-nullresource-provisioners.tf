#Create null resource and provisioners

resource "null_resource" "name" {
  depends_on = [
    module.ec2_public
  ]

  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    private_key = file("private-key/terraform-key.pem")
  }

  #File provisioner : copies the pem file to /tmp/terrafrom-key.pem
  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }

  #Remote exec provisioner to execute commands on remote machine connect using above connection
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }

  #Local exec provisioner, these provisioner are used to do some stuff after a resource is created
  provisioner "local-exec" {
    command     = "echo VPC created on date and VPC ID: ${module.onestopnews.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    
    on_failure  = continue
  }


#when = destroy is mentioned to say terraform to execute this only during destroy time of resource
#By default terraform defines all provioners as creation time provisioners

/* provisioner "local-exec" {
    command     = "echo VPC destroy on date and VPC ID: ${module.onestopnews.vpc_id} >> destroy-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    on_failure  = continue
  }
  */
}
