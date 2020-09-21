module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc.name
  cidr = var.vpc.cidr

  azs             = var.vpc.azs
  private_subnets = var.vpc.private_subnet
  public_subnets  = var.vpc.public_subnet

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = var.ec2.name
  instance_count = var.ec2.instance_count

  ami                    = var.ec2.ami
  instance_type          = var.ec2.i_type
  key_name               = var.ec2.k_name
  vpc_security_group_ids = [module.web_server_sg.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = var.sg.name
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.sg.ingress
}

module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"
  name = var.ssh_sg
  description = "Security group for SSH For Remote Execution"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.ssh_sg.ingress
}
