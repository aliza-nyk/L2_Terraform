terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:/Users/aliza/Documents/Winter2024/SYST35144/AWS_creds.txt"
}