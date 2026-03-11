resource "aws_cloudwatch_log_group" "st_flowlogs" {
  name              = "/aws/vpc/st-flowlogs"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "ot_flowlogs" {
  name              = "/aws/vpc/ot-flowlogs"
  retention_in_days = 30
}
