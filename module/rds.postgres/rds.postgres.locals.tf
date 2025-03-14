locals {
  postgreSQL = {
    engin = "postgres"
    version = "17.2"
    identifier = "ai-${var.environment}"
  }
}