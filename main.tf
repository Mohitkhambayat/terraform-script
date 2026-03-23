module "vpc" {
  source = "./modules/VPC"
  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source = "./modules/Subnets"

  vpc_id = module.vpc.vpc_id

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs = ["ap-south-1a", "ap-south-1b"]
}

module "igw" {
  source = "./modules/IGW"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source = "./modules/NAT"
  public_subnet_id = module.subnets.public_subnet_ids[0]
}

module "route_tables" {
  source = "./modules/route_tables"

  vpc_id            = module.vpc.vpc_id
  igw_id            = module.igw.igw_id
  nat_gateway_id    = module.nat.nat_id

  public_subnet_ids  = module.subnets.public_subnet_ids
  private_subnet_ids = module.subnets.private_subnet_ids
}

module "ec2" {
  source = "./modules/EC2"

  public_subnet_id  = module.subnets.public_subnet_ids[0]
  private_subnet_id = module.subnets.private_subnet_ids[0]
}
