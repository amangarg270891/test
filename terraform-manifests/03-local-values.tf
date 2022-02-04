locals {
 owners = var.business_unit
 environment = var.environment
 name = "${var.business_unit}-${var.environment}"
 common_tags = {
   owners = local.owners
   environment = local.environment
 }
}
