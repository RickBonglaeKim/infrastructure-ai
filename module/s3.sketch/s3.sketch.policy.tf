data "aws_iam_policy_document" "sketch" {
  statement {
    principals {
      type = "AWS"
      identifiers = [var.iam-sketch-arn]
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
      aws_s3_bucket.sketch.arn,
      "${aws_s3_bucket.sketch.arn}/*"
    ]
  }
  
  statement {
    principals {
      type = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.sketch.arn}/*"]
    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [aws_cloudfront_distribution.sketch.arn]
    }
  }
}


resource "aws_s3_bucket_policy" "sketch" {
  bucket = aws_s3_bucket.sketch.id
  policy = data.aws_iam_policy_document.sketch.json
}