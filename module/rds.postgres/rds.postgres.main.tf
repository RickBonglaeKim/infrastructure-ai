

resource "aws_db_instance" "postgreSQL" {
  
  engine = local.postgreSQL.engin
  engine_version = local.postgreSQL.version
  identifier =  local.postgreSQL.identifier

  username = var.user-name
  password =var.user-password
  instance_class = var.instance-class
  allocated_storage = var.storage-size
  storage_type = var.storage-type
  
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.security-group-postgres.id]
  db_subnet_group_name = aws_db_subnet_group.postgres.name

  skip_final_snapshot = true
  
  allow_major_version_upgrade = true
  performance_insights_enabled = true
  storage_encrypted = true
  
  apply_immediately = true

}