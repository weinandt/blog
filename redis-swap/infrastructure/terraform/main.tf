terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "redis_swap" {
  ami           = "ami-0283a57753b18025b" # 64 bit AMD Ubuntu 22.04 in us-east-2
  instance_type = "t2.micro"

  tags = {
    Name = "RedisSwapInstance"
  }
}
