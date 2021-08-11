/*

This example Terraform file creates a bare minimum Platform9 managed cluster on AWS. All values in `local` are required.
Refer to the provider documentation below for details on finding these values.

https://registry.terraform.io/providers/platform9/pf9/latest/docs

*/

locals {
  p9_tenant_uuid        = ""
  cloud_provider_uuid   = ""
  aws_keypair_name      = ""
  tags                  = {
    source: "terraform/platform9/pf9"
    provider_version: "0.1.5"
  }
}

terraform {
  required_providers {
    pf9 = {
      source = "platform9/pf9"
      version = "0.1.5"
    }
  }
}

provider "pf9" {}

resource "pf9_cluster" "simple-aws-cluster" {
  /*P9 Account Values*/
  project_uuid        = local.p9_tenant_uuid
  cloud_provider_uuid = local.cloud_provider_uuid

  /*Cluster Config Values*/
  name                = "simple-aws-cluster"
  containers_cidr     = "10.20.0.0/16"
  services_cidr       = "10.21.0.0/16"
  num_masters         = 1
  num_workers         = 1
  
  /*AWS Specific Values*/
  ami                 = "ubuntu"
  azs                 = ["us-east-1b"]
  region              = "us-east-1"
  worker_flavor       = "t2.medium"
  master_flavor       = "t2.medium"
  ssh_key             = local.aws_keypair_name
  tags                = local.tags
}