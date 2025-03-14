
resource "aws_s3_bucket" "ai_ppt" {
  bucket = local.ai-ppt-name

  tags = {
    name = local.ai-ppt-name
  }
}