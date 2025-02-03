terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.35.0"
    }
  }
}

provider "aws" {
    region = var.BUCKET_REGION
    profile = "anirudh-power"
    #config opts
}