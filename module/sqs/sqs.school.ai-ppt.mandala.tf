
resource "aws_sqs_queue" "school_ai_ppt_mandala" {
  name = local.school-ai-ppt-mandala
  fifo_queue = true
}

data "aws_iam_policy_document" "allow__sqs_school_ai_ppt_mandala" {
  statement {
    principals {
      type = "AWS"
      identifiers = [var.iam]
    }
    effect = "Allow"
    actions = local.sqs-policy-actions
    resources = [
      aws_sqs_queue.school_ai_ppt_mandala.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "allow__sqs_school_ai_ppt_mandala" {
  queue_url = aws_sqs_queue.school_ai_ppt_mandala.url
  policy = data.aws_iam_policy_document.allow__sqs_school_ai_ppt_mandala.json
}