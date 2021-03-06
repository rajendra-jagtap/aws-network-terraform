#################################################
# S3 Backend
#################################################

terraform {
  backend "s3" {
    bucket = "var.bucket"
    key    = "var.key"
    region = "var.region"
   }
}

#################################################
# Module to create VPC, Subnets, etc
#################################################

module "networking" {
  source                = "./modules/network/"
  region                = "${var.region}"
  environment           = "${var.environment}"
  vpc_cidr              = "${var.vpc_cidr}"
  public_subnets_cidr   = "${var.public_subnets_cidr}"
  private_subnets_cidr  = "${var.private_subnets_cidr}"
  availability_zones    = "${var.availability_zones}"
}
