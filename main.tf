###############################################################################
# VPC
###############################################################################

resource "alicloud_vpc" "this" {
  vpc_name   = var.name
  cidr_block = var.cidr

  tags = merge(
    { "Name" = var.name },
    var.tags,
    var.vpc_tags
  )
}

###############################################################################
# VSwitch
###############################################################################

resource "alicloud_vswitch" "this" {
  count = length(var.subnets)

  vpc_id     = alicloud_vpc.this.id
  cidr_block = var.subnets[count.index]
  zone_id    = length(regexall("^[a-z]{2}-", element(var.azs, count.index))) > 0 ? element(var.azs, count.index) : null

  vswitch_name = format("${var.name}-${var.vswitch_suffix}-%s", element(var.azs, count.index))

  tags = merge(
    { "Name" = format("${var.name}-${var.vswitch_suffix}-%s", element(var.azs, count.index)) },
    var.tags,
    var.vswitch_tags
  )
}
