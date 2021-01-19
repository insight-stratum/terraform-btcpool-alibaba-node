variable "alicloud_region" {
  default = "us-east-1"
}

variable "vpc_name" {
  default = "example"
}

variable "private_key_path" {}
variable "public_key_path" {}

provider "alicloud" {
  region = var.alicloud_region
}

module "defaults" {
  source           = "../.."
  vpc_name         = var.vpc_name
  num_azs          = 2
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
}

output "public_ip" {
  value = module.defaults.public_ip
}