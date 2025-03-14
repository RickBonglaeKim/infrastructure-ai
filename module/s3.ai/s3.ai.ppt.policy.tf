
data "aws_iam_policy_document" "allow__s3_ai_ppt" {
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
      aws_s3_bucket.ai_ppt.arn,
      "${aws_s3_bucket.ai_ppt.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "allow__s3_ai_ppt" {
  bucket = aws_s3_bucket.ai_ppt.id
  policy = data.aws_iam_policy_document.allow__s3_ai_ppt.json
}