
locals {
  cloud-front-principal = "cloudfront.amazonaws.com"
}


data "aws_iam_policy_document" "allow__s3_school_sketch" {
  
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
      aws_s3_bucket.school_sketch.arn,
      "${aws_s3_bucket.school_sketch.arn}/*"
    ]
  }
  
  statement {
    principals {
      type = "Service"
      identifiers = [local.cloud-front-principal]
    }
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.school_sketch.arn}/*"]
    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [aws_cloudfront_distribution.school_sketch.arn]
    }
  }

}


resource "aws_s3_bucket_policy" "allow__s3_school_sketch" {
  bucket = aws_s3_bucket.school_sketch.id
  policy = data.aws_iam_policy_document.allow__s3_school_sketch.json
}