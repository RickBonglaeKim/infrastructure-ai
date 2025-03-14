
resource "aws_s3_bucket" "ai_sketch" {
  bucket = local.ai-sketch-name

  tags = {
    name = local.ai-sketch-name
  }
}


resource "aws_s3_bucket_cors_configuration" "ai_sketch" {
  bucket = aws_s3_bucket.ai_sketch.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["HEAD", "GET"]
    allowed_origins = ["*"]
  }
}