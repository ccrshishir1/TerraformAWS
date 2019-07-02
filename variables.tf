variable "ACCESS_KEY_ID" {}
variable "SECRET_ACCESS_KEY" {}
variable "region" {}
variable "CIDR_BLOCK" {}
variable "publicCIDRblock" {}
variable "public1CIDRblock" {}
variable "privateCIDRblock" {}
variable "publicAZ" {}
variable "public1AZ" {}
variable "privateAZ" {}
variable "webamis"{
    type = "map"
}
variable "webinstancetype" {}
variable "databaseamis" {
    type = "map"
}
variable "databaseinstancetype" {}
variable "asgami" {
    type = "map"
}
