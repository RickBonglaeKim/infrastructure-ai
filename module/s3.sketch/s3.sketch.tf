resource "aws_s3_bucket" "sketch" {
  bucket = local.s3-sketch-name
  
  tags = {
    Environment = var.environment
    Name = local.s3-sketch-name
  }
}