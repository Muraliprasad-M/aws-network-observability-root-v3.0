data "aws_vpn_connections" "all" {}

data "aws_nat_gateways" "all" {
  filter {
    name   = "state"
    values = ["available"]
  }
}

locals {
  vpn_ids = data.aws_vpn_connections.all.ids

  natgw_ids = [
    for nat in data.aws_nat_gateways.all.nat_gateways :
    nat.id
  ]
}
