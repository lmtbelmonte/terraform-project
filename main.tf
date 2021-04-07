provider "aws" {
  region = terraform.workspace == "default" ? var.main_region : var.secondary_region
}

module "vpc" {
  source = "./modules/vpc"
  # region = var.main_region
}

resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id
  subnet_id     = module.vpc.subnet_id
  instance_type = var.instance_type
  tags = {
    Name = join("-", ["instancia", terraform.workspace])
  }
}