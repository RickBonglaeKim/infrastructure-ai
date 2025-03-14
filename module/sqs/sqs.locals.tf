locals {

  iam-ai = "arn:aws:iam::357079910360:user/service@ai"
  
  school-ai-ppt-mandala = "school_ai_ppt_mandala-${var.environment}.fifo"
  school-ai-ppt-pitr = "school_ai_ppt_pitr-${var.environment}.fifo"

  experience-ai-ppt-mandala = "experience_ai_ppt_mandala-${var.environment}.fifo"
  experience-ai-ppt-pitr = "experience_ai_ppt_pitr-${var.environment}.fifo"

  sqs-policy-actions = [
    "SQS:GetQueueAttributes",
    "SQS:GetQueueUrl",
    "SQS:ReceiveMessage",
    "SQS:ChangeMessageVisibility",
    "SQS:SetQueueAttributes",
    "SQS:SendMessage",
    "SQS:DeleteMessage"
  ]

}