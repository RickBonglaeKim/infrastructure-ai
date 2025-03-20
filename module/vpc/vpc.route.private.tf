
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.route_table-private-name
    Environment = var.environment
  }
}

resource "aws_route" "private-nat_gateway" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = local.cidr.all
  nat_gateway_id = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "private" {
  for_each = var.subnet-private

  subnet_id = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private.id
}