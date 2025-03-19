
data "terraform_remote_state" "compute" {
  backend = "remote"

  config = {
    organization = "i-screamarts-AI"
    workspaces = {
      name = "AI-infrastructure--compute-${var.environment}"
    }
  }
}