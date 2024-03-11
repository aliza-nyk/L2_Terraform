module "security-group" {
  source = "./security-group"
  vpc_id = module.vpc.vpc-tf-id
}
module "ec2" {
  source = "./ec2"
  sg-id  = module.security-group.sg-tf-id
  subnet = module.vpc.subnet-ids
}

module "vpc" {
  source = "./vpc"
}

