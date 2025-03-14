
resource "aws_s3_bucket" "school_sketch" {
  bucket = local.school-sketch-name
  
  tags = {
    environment = var.environment
    name = local.school-sketch-name
  }
}


resource "aws_s3_bucket_cors_configuration" "school_sketch" {
  bucket = aws_s3_bucket.school_sketch.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["HEAD", "GET"]
    allowed_origins = ["*"]
  }
}