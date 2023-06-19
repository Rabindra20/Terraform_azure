module "resource_grp" {
  source      = "./modules/common/resource_grp"
  resourcename     = "test"
  location = "central us"
  #   tags = {
  #   Environment = var.Environment
  #   Team = var.Team
  # }
}
# module "resource" {
#   source      = "./modules/common/resource_grp"
#   resourcename     = "test1"
#   location = "central us"
  #   tags = {
  #   Environment = var.Environment
  #   Team = var.Team
  # }
# }
# module "app service-linux" {
#   source      = "./modules/common/App Service-linux"
#   resource_group_name = module.resource_grp.resourcename
#   location = module.resource_grp.location
#   os_type             = "Linux"
#   sku_name            = "P1v2"
#   appserviceplanname = "test"
#   webapp_name = "test"
#   repo_url = "https://github.com/"
#   branch   = "master"
#   use_manual_integration = true
#   use_mercurial = false

# }

# module "azvm" {
#   source      = "./modules/common/azure-vm"
#   # admin_username      = "${var.vmusername}"
#   # admin_password      = "${var.vmpassowrd}"
#   # name = "${var.name}"
#   vmusername = "demo"
#   vmpassword = "demo@1234567"
#   vmname = "demo"
#   rg_location =  module.resource_grp.location
#   rg_name = module.resource_grp.resourcename
# }

# module "storage_account" {
#   source      = "./modules/common/Storage account"
#   storage_account_name     = "test"
#   resource_group_name      = module.resource_grp.resourcename
#   location                 = module.resource_grp.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

module "resource_grp_powerflow" {
  source      = "./modules/common/resource_grp"
  resourcename     = "test1"
  location = "central us"
}
module "servicebus" {
  source      = "./modules/common/Service_bus"
  servicebus_name = "powerflow"
  resource_group_name      = module.resource_grp_powerflow.resourcename
  location                 = module.resource_grp_powerflow.location 
  sku = "Standard"
  tag_source = "test"
}
module "aks" {
  count = var.enabled ? 1 : 0
  source = "./modules/common/Aks"
  resource_group_name      = module.resource_grp_powerflow.resourcename
  location                 = module.resource_grp_powerflow.location 
  agent_count              = 1
  cluster_name             = "k8s-test"
  enable_auto_scaling_node_pool = false
  aks_service_principal_app_id = var.ARM_CLIENT_ID
  aks_service_principal_client_secret = var.ARM_CLIENT_SECRET

}
module "keyvault" {
  source = "./modules/common/Key-vault"
  keyvault_name = "test"
  sku_name = "standard"
  resource_group_name      = module.resource_grp_powerflow.resourcename
  location                 = module.resource_grp_powerflow.location 
}
module "acr" {
  count = var.enabled ? 1 : 0
  source = "./modules/common/acr"
  acr_name = "testsss"
  sku_name = "Premium"
  resource_group_name      = module.resource_grp_powerflow.resourcename
  location                 = module.resource_grp_powerflow.location 
}
