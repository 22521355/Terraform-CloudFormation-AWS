/*
  Main file - VPC Project with Modular Approach
*/

provider "aws" {
  region = var.aws_region
}

# Module VPC
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  environment          = var.environment
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

# Module Internet Gateway
module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

# Module NAT Gateway
module "nat_gateway" {
  source = "./modules/nat_gateway"

  create_nat_gateway   = var.create_nat_gateway
  public_subnet_id     = module.vpc.public_subnet_id
  environment          = var.environment
  internet_gateway_id  = module.internet_gateway.internet_gateway_id
}

# Module Route Tables
module "route_tables" {
  source = "./modules/route_tables"

  vpc_id              = module.vpc.vpc_id
  environment         = var.environment
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  nat_gateway_id      = module.nat_gateway.nat_gateway_id
  public_subnet_id    = module.vpc.public_subnet_id
  private_subnet_id   = module.vpc.private_subnet_id
}

# Module Security Group (Default)
module "default_security_group" {
  source = "./modules/security_group"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  name        = "default"
  description = "Default security group to allow inbound/outbound from the VPC"
  
  ingress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      self        = true
      description = "Allow all inbound traffic from the same security group"
    }
  ]
  
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"  
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]
}

# Module Security Group cho Public EC2
module "public_ec2_security_group" {
  source = "./modules/security_group"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  name        = "public-ec2"
  description = "Security group for public EC2 instance"
  
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.allowed_ssh_cidr]
      description = "Allow SSH access from specific IP"
    }
  ]
  
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]
}

# Module Security Group cho Private EC2
module "private_ec2_security_group" {
  source = "./modules/security_group"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  name        = "private-ec2"
  description = "Security group for private EC2 instance"
  
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      security_groups  = [module.public_ec2_security_group.security_group_id]
      description = "Allow SSH access from within VPC"
    }
  ]
  
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]
}

# Module Key Pair
module "key_pair" {
  source = "./modules/key_pair"

  key_name    = "${var.environment}-key"
  public_key  = var.ssh_public_key
  environment = var.environment
}

# Module EC2 Instances
module "ec2_instances" {
  source = "./modules/ec2"

  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  key_name                = module.key_pair.key_name
  public_subnet_id        = module.vpc.public_subnet_id
  private_subnet_id       = module.vpc.private_subnet_id
  public_security_group_id = module.public_ec2_security_group.security_group_id
  private_security_group_id = module.private_ec2_security_group.security_group_id
  environment             = var.environment
  create_public_instance  = var.create_public_instance
  create_private_instance = var.create_private_instance
}