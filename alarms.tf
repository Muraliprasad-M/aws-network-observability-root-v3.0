resource "aws_cloudwatch_metric_alarm" "vpn_tunnel_down" {

  for_each = toset(local.vpn_ids)

  alarm_name = "vpn-tunnel-down-${each.value}"

  namespace   = "AWS/VPN"
  metric_name = "TunnelState"

  comparison_operator = "LessThanThreshold"
  threshold           = 1

  evaluation_periods = 1
  period             = 60
  statistic          = "Minimum"

  alarm_actions = [aws_sns_topic.alerts.arn]

  dimensions = {
    VpnId = each.value
  }
}
