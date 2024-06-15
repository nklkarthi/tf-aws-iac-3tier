terraform {
  required_version = "1.8.5"

  cloud {
    organization = "nklkarthi"

    workspaces {
      name = "tf-aws-iac-3tier"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }

  }
}

provider "aws" {
  # Configuration options
  region  = var.region
}
