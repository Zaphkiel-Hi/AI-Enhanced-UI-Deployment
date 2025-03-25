terraform {
  backend "s3" {
    bucket  = "chatbot395"   # Change this to your bucket name
    region         = "ap-south-1"            # Your AWS region (Mumbai)
    key            = "Chatbot-UI/EKS-TF/terraform.tfstate"
    dynamodb_table = "Lock-Files"            # Make sure this matches exactly
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
