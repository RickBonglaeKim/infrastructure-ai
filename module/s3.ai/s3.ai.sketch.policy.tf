locals {
  cloud-front-principal = "cloudfront.amazonaws.com"
}

data "aws_iam_policy_document" "allow__s3_ai_sketch" {
  statement {
    principals {
      type = "AWS"
      identifiers = [local.iam]
    }
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      aws_s3_bucket.ai_sketch.arn,
      "${aws_s3_bucket.ai_sketch.arn}/*"
    ]
  }

  statement {
    principals {
      type = "Service"
      identifiers = [local.cloud-front-principal]
    }
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.ai_sketch.arn}/*"]
    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [aws_cloudfront_distribution.ai_sketch.arn]
    }
  }
}


resource "aws_s3_bucket_policy" "allow__s3_ai_sketch" {
  bucket = aws_s3_bucket.ai_sketch.id
  policy = data.aws_iam_policy_document.allow__s3_ai_sketch.json
}