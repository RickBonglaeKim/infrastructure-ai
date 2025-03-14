resource "aws_db_subnet_group" "postgres" {
  name = "postgres-${var.environment}"
  subnet_ids = [for subnet in data.terraform_remote_state.network.outputs.subnet-database : subnet.id]
}