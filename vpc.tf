module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.13.0"

  name                 = "tf-controller-ec2-instance-demo-vpc"
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    Name       = "tf-controller-ec2-instance-demo-vpc"
    Owner      = "solution architects"
    Purpose    = "TF controller demo of deployment of an ec2 instance and requirements"
    Deployed   = "tf-controller"
    Repository = "git@github.com:talaverant/terraformfiles.git"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

