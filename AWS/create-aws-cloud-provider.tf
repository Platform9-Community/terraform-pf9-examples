/*

This example Terraform file creates a Platform9 cloud provider. All values in `local` are required.
Refer to the provider documentation below for details on finding these values.

https://registry.terraform.io/providers/platform9/pf9/latest/docs

*/

locals {
  p9_tenant_uuid            = ""
  aws_account_key           = ""
  aws_account_secret        = ""
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

resource "pf9_aws_cloud_provider" "My-AWS-Provider" {
    name                = "My-AWS-Provider"
    type                = "aws"
    key                 = local.aws_account_key
    secret              = local.aws_account_secret
    project_uuid        = local.p9_tenant_uuid
}