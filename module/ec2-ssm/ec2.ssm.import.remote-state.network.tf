
data "terraform_remote_state" "network" {
  backend = "remote"

  config = {
    organization = "i-screamarts-AI"
    workspaces = {
      name = "AI-infrastructure--network-${var.environment}"
    }
  }
}