variable "region" {}

variable "st_vpc_id" {}
variable "ot_vpc_id" {}

variable "st_tgw_id" {}
variable "ot_tgw_id" {}

variable "st_firewall_name" {}
variable "ot_firewall_name" {}

variable "alarm_email" {}

variable "zscaler_st_instances" {
  type = list(string)
}

variable "zscaler_ot_instances" {
  type = list(string)
}
