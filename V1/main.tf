//configuração do provider para que o terraform acesse a aws

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

//configuração responsável por se conectar à AWS
provider "aws" {
  region = var.region
  shared_credentials_file = var.credentials
  profile = var.profile
  }

