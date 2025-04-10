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
      name = "AI-infrastructure--storage-prod"
    } 
  } 
  
}

provider "aws" {
  region = "ap-northeast-2"
}