/*

This example Terraform file creates a bare minimum Platform9 managed cluster on Azure. All values in `local` are required.
Refer to the provider documentation below for details on finding these values.

https://registry.terraform.io/providers/platform9/pf9/latest/docs

*/

locals {
  p9_tenant_uuid        = ""
  cloud_provider_uuid   = ""
  azure_public_ssh_key  = ""
  tags                  = {
    source: "terraform/platform9/pf9"
    provider_version: 0.1.5
  }
}

terraform {
  required_providers {
    pf9 = {
      source = "platform9/pf9"
    provider_version: "0.1.5"
    }
  }
}

provider "pf9" {}

resource "pf9_cluster" "simple-azure-cluster" {
  /*P9 Account Values*/
  project_uuid        = local.p9_tenant_uuid
  cloud_provider_uuid = local.cloud_provider_uuid

  /*Cluster Config Values*/
  name                = "simple-azure-cluster"
  containers_cidr     = "10.20.0.0/16"
  services_cidr       = "10.21.0.0/16"
  num_masters         = 1
  num_workers         = 1
  
  /*Azure Specific Values*/
  location            = "eastus"
  zones               = ["1", "2"]
  master_sku          = "Standard_A4_v2"
  worker_sku          = "Standard_A4_v2"
  ssh_key             = local.azure_public_ssh_key
  tags                = local.tags
}

