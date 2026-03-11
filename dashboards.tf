resource "aws_cloudwatch_dashboard" "st_dashboard" {

  dashboard_name = "st-network-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = flatten([
            for vpn in local.vpn_ids : [
              ["AWS/VPN","TunnelState","VpnId",vpn],
              ["AWS/VPN","TunnelLatency","VpnId",vpn],
              ["AWS/VPN","TunnelPacketLoss","VpnId",vpn]
            ]
          ])
          title  = "ST VPN Monitoring"
          stat   = "Average"
          period = 60
          region = var.region
        }
      }
    ]
  })
}

resource "aws_cloudwatch_dashboard" "ot_dashboard" {

  dashboard_name = "ot-network-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = flatten([
            for vpn in local.vpn_ids : [
              ["AWS/VPN","TunnelState","VpnId",vpn],
              ["AWS/VPN","TunnelLatency","VpnId",vpn],
              ["AWS/VPN","TunnelPacketLoss","VpnId",vpn]
            ]
          ])
          title  = "OT VPN Monitoring"
          stat   = "Average"
          period = 60
          region = var.region
        }
      }
    ]
  })
}

resource "aws_cloudwatch_dashboard" "noc_dashboard" {

  dashboard_name = "network-noc-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        width  = 24
        height = 6

        properties = {
          metrics = [
            ["AWS/TransitGateway","PacketDropCount","TransitGateway",var.st_tgw_id],
            ["AWS/TransitGateway","PacketDropCount","TransitGateway",var.ot_tgw_id]
          ]
          title  = "TGW Packet Drops"
          stat   = "Sum"
          period = 300
        }
      }
    ]
  })
}
