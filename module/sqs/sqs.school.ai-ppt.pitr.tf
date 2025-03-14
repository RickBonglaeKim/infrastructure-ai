
resource "aws_sqs_queue" "school_ai_ppt_pitr" {
  name = local.school-ai-ppt-pitr
  fifo_queue = true
}

data "aws_iam_policy_document" "allow__sqs_school_ai_ppt_pitr" {
  statement {
    principals {
      type = "AWS"
      identifiers = [var.iam]
    }
    effect = "Allow"
    actions = local.sqs-policy-actions
    resources = [
      aws_sqs_queue.school_ai_ppt_pitr.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "allow__sqs_school_ai_ppt_pitr" {
  queue_url = aws_sqs_queue.school_ai_ppt_pitr.url
  policy = data.aws_iam_policy_document.allow__sqs_school_ai_ppt_pitr.json
}