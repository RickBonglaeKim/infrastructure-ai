
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    name = local.internet-gateway-name
    environment = var.environment
  }
}