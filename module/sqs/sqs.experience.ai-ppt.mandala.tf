
resource "aws_sqs_queue" "experience_ai_ppt_mandala" {
  name = local.experience-ai-ppt-mandala
  fifo_queue = true
}

data "aws_iam_policy_document" "allow__sqs_experience_ai_ppt_mandala" {
  statement {
    principals {
      type = "AWS"
      identifiers = [local.iam-ai]
    }
    effect = "Allow"
    actions = local.sqs-policy-actions
    resources = [
      aws_sqs_queue.experience_ai_ppt_mandala.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "allow__sqs_experience_ai_ppt_mandala" {
  queue_url = aws_sqs_queue.experience_ai_ppt_mandala.url
  policy = data.aws_iam_policy_document.allow__sqs_experience_ai_ppt_mandala.json
}