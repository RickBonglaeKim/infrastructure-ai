terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.79.0"
    }
  }
  
  cloud {
    organization = "i-screamarts-AI"
    workspaces {
      project = "DEV-Infrastructure"
      name = "AI-infrastructure--storage-dev"
    }
  }
  
}

provider "aws" {
  region = "ap-northeast-2"
}