/*

This example Terraform file creates a Platform9 cloud provider. All values in `local` are required.
Refer to the provider documentation below for details on finding these values.

https://registry.terraform.io/providers/platform9/pf9/latest/docs

*/

locals {
  p9_tenant_uuid            = ""
  azure_client_id           = ""
  azure_client_secret       = ""
  azure_subscription_id     = ""
  azure_tenant_id           = ""
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

resource "pf9_azure_cloud_provider" "My-Azure-Provider" {
    name                = "My-Azure-Provider"
    type                = "azure"
    project_uuid        = local.p9_tenant_uuid
    client_id           = loca.azure_client_id
    client_secret       = local.azure_client_secret
    subscription_id     = local.azure_subscription_id
    tenant_id           = local.azure_tenant_id
}
