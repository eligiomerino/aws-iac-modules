# Terraform Modules For Serverless IaC Layers in AWS
By [@EligioMerino](https://github.com/eligiomerino), 2024.

This is a Terraform Modules project that can be used to build high-availability AWS infrastructure per service layer, such as:

* Network (VPC): It builds an HA VPC within a region with 2 AZs, with 1 public subnets per AZ and 1 private subnet per AZ.
* Containers (EKS Fargate): (to-do)
* Elastic Block Storage (EBS): (to-do)
* Serverless relational database (Aurora): (to-do)
* Content distribution (CloudFront): (to-do)
* Monitoring and alerting (CloudWatch): (to-do)

Every single hands-on project require to manually build a bunch of services, and the problem with that is to rember all of those services in sequence to later delete them in reverse order. For instance, to have a NAT Gateway deployed in a public subnet does require to pull an elastic (public) IP to have it assigned to the NAT Gateway. But when the NAT Gateway gets manually deleted it is easy to forget to also release (delete) the asssigned EIP. I built this project in order to use Terraform Modules that could simplify the backbone building (AWS infrastructure) so it can be easier to focus on the hands-on for a lab practice or for a real architecture implementation.

For example, this code configures and builds a HA VPC in a region withing 2 AZs - including related resources such as an Internet Gateway and a NAT Gateway:
```
/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48"
    }
  }
  required_version = "~> 1.5"
}

locals {
  environment = "development"
  vpc_cidr = "10.0.0.0/16"
}

# Configure the AWS Provider
# Change the profile name to the one you already configured uwing the AWS CLI
# For instance:
#   aws configure --profile development
provider "aws" {
  region = "us-east-2"
  profile= local.environment

  default_tags {
    tags = {
      terraform   = "true"
      environment = local.environment
      project     = "aws-vpc-iac"
    }
  }
}

module "network" {
  source = "../../../aws/modules/network/vpc"
  cidr = local.vpc_cidr

  tags = {
    "Name" = "myLabVPC"
  }
}

module "default_security_group" {
  source = "../../../aws/modules/network/default-security-group"
  vpc_id = module.network.vpc_id
  
  port = 80
  name = "default"
  
  # the IP protocol name (tcp, udp, icmp, icmpv6)
  protocol = "tcp"
}

module "internet_gateway" {
  source = "../../../aws/modules/network/internet-gateway"

  vpc_id = module.network.vpc_id
}

# Fetches AZs in the Region
data "aws_availability_zones" "azs" {}

# Creates public and private subnets on the first AZ
module "public_subnets" {
  source = "../../../aws/modules/network/subnet"
  vpc_id = module.network.vpc_id

  count = "${length(var.public_cidrs)}"
  cidr = "${var.public_cidrs[count.index]}"
  az = data.aws_availability_zones.azs.names[count.index]
  name = format("%s-%s","public-subnet", "${element(split("-", data.aws_availability_zones.azs.names[count.index]), 2)}") 
  map_public_ip = true
}

module "private_subnets" {
  source = "../../../aws/modules/network/subnet"
  vpc_id = module.network.vpc_id

  count = "${length(var.private_cidrs)}"
  cidr = "${var.private_cidrs[count.index]}"
  az = data.aws_availability_zones.azs.names[count.index]
  name = format("%s-%s","private-subnet", "${element(split("-", data.aws_availability_zones.azs.names[count.index]), 2)}")
}

module "nat_gateway" {
  depends_on = [module.internet_gateway, module.public_subnets]
  source = "../../../aws/modules/network/nat-gateway"

  subnet_id = module.public_subnets[0].subnet_id
  name = "ngw"
}

# Updates the default route table created by the VPC
# to allow Internet traffic and subscribes the public subnets
module "default_rt" {
  depends_on = [module.internet_gateway, module.public_subnets]
  source = "../../../aws/modules/network/default-route-table"

  vpc_cidr = local.vpc_cidr
  default_rt_id = module.network.default_route_table_id
  igw_id = module.internet_gateway.internet_gateway_id
  name = "public_rt"
}
module "default_rt_association" {
  depends_on = [module.default_rt]
  source = "../../../aws/modules/network/route-table-association"

  count = "${length(module.public_subnets)}"

  rt_id = module.network.default_route_table_id
  subnet = "${module.public_subnets[count.index].subnet_id}" 
}

# Creates a route table for local VPC traffic
# and subscribes the private subnets
module "private_rt" {
  depends_on = [module.internet_gateway, module.nat_gateway, module.private_subnets]
  source = "../../../aws/modules/network/private-route-table"

  vpc_id = module.network.vpc_id
  vpc_cidr = local.vpc_cidr
  ngw_id = module.nat_gateway.id
  name = "private_rt"
}
module "private_rt_association" {
  depends_on = [module.private_rt]
  source = "../../../aws/modules/network/route-table-association"

  count = "${length(module.private_subnets)}"

  rt_id = module.private_rt.route_table_id
  subnet = "${module.private_subnets[count.index].subnet_id}"
}
```
