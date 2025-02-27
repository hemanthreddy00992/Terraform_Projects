
# networking infra 
module "vpc" {
  source = "./vpc"
  cidr = var.cidr
  pub_cidr = var.pub_cidr
  ava_zone = var.ava_zone
}

module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./EC2"
  ava_zone = var.ava_zone
  sg_id = module.security_group.sg_id
  instance_type = var.instance_type
  ami_id = var.ami_id
  subnet_id = module.vpc.subnet_id
  jenkins_install = templatefile("./jenkins_script/install.sh", {})
}

module "lb_target_group" {
  source = "./lb_target_group"
  vpc_id = module.vpc.vpc_id
  ec2_instance_id = module.ec2.ec2_instance_id
}

module "lb" {
  source = "./lb"
  sg_id = module.security_group.sg_id
  subnet_id = module.vpc.subnet_id
  ec2_instance_id = module.ec2.ec2_instance_id
  lb_tg_arn = module.lb_target_group.lb_tg_arn
}



