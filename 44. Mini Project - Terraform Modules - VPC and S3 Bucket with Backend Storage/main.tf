provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  vpc_name            = "demo-vpc"
  public_subnet_cidr  = "10.0.1.0/24"
  az                  = "us-east-1a"
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "akinwale-unique-terraform-demo-bucket"
}
