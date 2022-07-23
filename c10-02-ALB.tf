module "onestopnews_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "7.0.0"
  # insert the 4 required variables here

  name               = "${local.name}-alb"
  load_balancer_type = "application"
  vpc_id             = module.onestopnews.vpc_id
  subnets            = [module.onestopnews.public_subnets[0], module.onestopnews.public_subnets[1]]
  security_groups    = [module.loadbalancer_sg.this_security_group_id]
  #Listners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  #Target Groups

  target_groups = [
    #App1 Target Group-TG index 0
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      #app1 target group -targets

      targets = {
        my_app1_vm1 = {
          target_id = module.ec2_private.id[0]
          port      = 80
        },
        my_app1_vm2 = {
          target_id = module.ec2_private.id[0]
          port      = 8080
        }
      }
      tags = local.common_tags # Target Group Tags
    }
  ]
}
