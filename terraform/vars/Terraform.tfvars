#Network
region  = "us-east-1"
vpc_id  = "vpc-0bfef430f473a07bf"
subnets = ["subnet-01cb6d1af12682c13", "subnet-020a2f62fcc3ec32e", "subnet-0caf0db80b3d01abd"]

#alb_sg
ingress_alb_from_port   = 80
ingress_alb_to_port     = 80
ingress_alb_protocol    = "tcp"
ingress_alb_cidr_blocks = ["0.0.0.0/0"]
egress_alb_from_port    = 0
egress_alb_to_port      = 0
egress_alb_protocol     = "-1"
egress_alb_cidr_blocks  = ["0.0.0.0/0"]

#alb
internal          = false
loadbalancer_type = "application"

#target_group
target_group_port                = 8080
target_group_protocol            = "HTTP"
target_type                      = "instance"
load_balancing_algorithm         = "round_robin"
health_check_path                = "/"
health_check_port                = 8080
health_check_protocol            = "HTTP"
health_check_interval            = 30
health_check_timeout             = 5
health_check_healthy_threshold   = 2
health_check_unhealthy_threshold = 2

#instance_sg
ingress_asg_cidr_from_port = 22
ingress_asg_cidr_to_port   = 22
ingress_asg_cidr_protocol  = "tcp"
ingress_asg_cidr_blocks    = ["0.0.0.0/0"]
ingress_asg_sg_from_port   = 8080
ingress_asg_sg_to_port     = 8080
ingress_asg_sg_protocol    = "tcp"
egress_asg_from_port       = 0
egress_asg_to_port         = 0
egress_asg_protocol        = "-1"
egress_asg_cidr_blocks     = ["0.0.0.0/0"]

#asg
max_size         = 3
min_size         = 1
desired_capacity = 2

#listener
listener_port     = 80
listener_protocol = "HTTP"
listener_type     = "forward"

#launch_template
ami_id               = "ami-0e001c9271cf7f3b9"
instance_type        = "t2.medium"
key_name             = "techiescamp"
user_data            = <<-EOF
#!/bin/bash
bash /home/ubuntu/start.sh
EOF
public_access        = true
instance_warmup_time = 30
target_value         = 50

owner       = "techiescamp"
environment = "dev"
cost_center = "techiescamp-commerce"
application = "pet-clinic"

# Network Vars
region              = "us-east-1"
vpc_id  = "vpc-0bfef430f473a07bf"
subnets = ["subnet-01cb6d1af12682c13", "subnet-020a2f62fcc3ec32e", "subnet-0caf0db80b3d01abd"]
multi_az            = false
publicly_accessible = true

# DB Vars
db_engine                   = "mysql"
db_storage_type             = "gp2"
db_username                 = "techiescamp"
db_instance_class           = "db.t2.micro"
db_storage_size             = 20
set_secret_manager_password = true
set_db_password             = false
db_password                 = "rdssecret"

# Security Group Vars
ingress_from_port   = 3306
ingress_to_port     = 3306
ingress_protocol    = "tcp"
ingress_cidr_blocks = ["0.0.0.0/0"]

egress_from_port   = 0
egress_to_port     = 0
egress_protocol    = "-1"
egress_cidr_blocks = ["0.0.0.0/0"]

# Backup vars
backup_retention_period  = 7
delete_automated_backups = true
copy_tags_to_snapshot    = true
skip_final_snapshot      = true
apply_immediately        = true

# Parameter store
parameter_store_secret_name = "/dev/petclinic/rds_endpoint"
type                        = "String"

# Tag Vars
owner       = "techiescamp"
environment = "dev"
cost_center = "techiescamp-commerce"
application = "rds"
