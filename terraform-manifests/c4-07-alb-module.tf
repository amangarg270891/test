module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.6.1"

  name            = "${local.environment}-alb"
  load_balancer_type = "application"
  vpc_id          = module.vpc.vpc_id
  security_groups = [module.security-group-alb.security_group_id]
  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  tags            = local.common_tags

  # Target Groups
  target_groups = [
    # App1 Target Group - TG Index = 0
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
      targets = {
        my_app1_vm1 = {
          target_id = module.ec2-instance_private_app1.id[0]
          port      = 80
        },
        my_app1_vm2 = {
          target_id = module.ec2-instance_private_app1.id[1]
          port      = 80
        }
      }
      tags =local.common_tags # Target Group Tags
    },

    # App2 Target Group - TG Index = 1
    {
      name_prefix          = "app2-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        my_app2_vm1 = {
          target_id = module.ec2-instance_private_app2.id[0]
          port      = 80
        },
        my_app2_vm2 = {
          target_id = module.ec2-instance_private_app2.id[1]
          port      = 80
        }
      }
      tags =local.common_tags # Target Group Tags
    },

    # App3 Target Group - TG Index = 2
    {
      name_prefix          = "app3-"
      backend_protocol     = "HTTP"
      backend_port         = 8080
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/login"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      #so that the user sticks to only one instance
      stickiness = {
        enabled = true
        cookie_duration = 86400
        type = "lb_cookie"
      }
      protocol_version = "HTTP1"
      targets = {
        my_app3_vm1 = {
          target_id = module.ec2-instance_private_app3.id[0]
          port      = 8080
        },
        my_app3_vm2 = {
          target_id = module.ec2-instance_private_app3.id[1]
          port      = 8080
        }
      }
      tags =local.common_tags # Target Group Tags
    }
  ]


# Listeners

# HTTP to HTTPS redirect - for all requests on Port 80, redirect to port 443
http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

#HTTPS Listener Index = 0 for HTTPS 443
  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed static message for root context"
        status_code  = "200"
        }
    }
  ]

  https_listener_rules = [
# Rule-1: /app1* should go to App1 EC2 instances
    {
      https_listener_index = 0
      priority = 1
      actions = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]
      conditions = [{
        path_patterns = ["/app1*"]
        #host_headers = [var.app1_dns_name]  //benefit: here you can mention multiple paths ex: app1, app3, app5, etc.. whereas in path patterns, it is  fixed to app1
    }]
   },

# Rule-2: /app2* should go to App2 EC2 instances
     {
      https_listener_index = 0
      priority = 2
       actions = [
         {
           type               = "forward"
           target_group_index = 1
         }
       ]
       conditions = [{
         path_patterns = ["/app2*"]
         #host_headers = [var.app2_dns_name]
       }]
      },

# Rule-3: /* should go to App3 - User-mgmt-WebApp EC2 Instances 
     {
      https_listener_index = 0
      priority = 3  # the priority for the root context should be defined in the last. If it is defined in the starting, then all requests will go to /* which will be totally wrong
       actions = [
         {
           type               = "forward"
           target_group_index = 2
         }
       ]
       conditions = [{
         path_patterns = ["/*"]
         #host_headers = [var.app3_dns_name]
       }]
      }

     ]
    }
