
resource "aws_nat_gateway" "this" {
  allocation_id = var.nat_gateway-allocation_id
  subnet_id = aws_subnet.public["a"].id

  tags = {
    Name = local.nat_gateway-name
    Environment = var.environment
  }
}