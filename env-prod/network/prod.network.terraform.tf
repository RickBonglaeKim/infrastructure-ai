terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.85.0"
    }
  }
  
  cloud {
    organization = "i-screamarts-AI"
    workspaces {
      project = "PROD-Infrastructure"
      name = "AI-infrastructure--network-prod"
    }
  }
  
}

provider "aws" {
  region = "ap-northeast-2"
}