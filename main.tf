module "storage" {
  source               = "./modules/storage"
  prefix               = var.prefix
  location             = var.location
  stalocation          = var.stalocation
  primary_subscription = var.primary_subscription
  destcontainer = var.destcontainer
}

module "datafactory" {
  source               = "./modules/datafactory"
  datafactoryname      = var.datafactoryname
  location             = var.location
  resource_groupname   = module.storage.resource_groupname
  destcontainer        = var.destcontainer
  stgkarthikdp203value = module.storage.stgkarthikdp203value
  depends_on = [
    module.storage
  ]
}

# module "synapsede" {
#   source               = "./modules/synapseworkspace"
#   synapseworkspacename = var.synapseworkspacename
#   # location                             = var.location
#   resource_groupname = module.storage.resource_groupname
#   lakeid             = module.storage.lakeid
# }

