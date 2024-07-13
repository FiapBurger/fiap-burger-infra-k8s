module "eks" {
  source = "./eks"
  labRole       = var.labRole
  subnetA       = var.subnetA
  subnetB       = var.subnetB
  subnetC       = var.subnetC
  sgId          = var.sgId
  accessConfig  = var.accessConfig
#  arnPrincipal  = var.arnPrincipal
  arnAdmEks     = var.arnAdmEks
  nodeName      = var.nodeName
  appName       = var.appName
}
