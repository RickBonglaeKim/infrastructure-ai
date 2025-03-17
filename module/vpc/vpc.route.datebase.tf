
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.route_table-database-name
    Environment = var.environment
  }
}

resource "aws_route_table_association" "database" {
  for_each = var.subnet-database

  subnet_id = aws_subnet.database[each.key].id
  route_table_id = aws_route_table.database.id
}