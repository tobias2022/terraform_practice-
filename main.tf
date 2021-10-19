locals {
  s3_bucket_name = "tobias.tk"
  tags = {
    created_by = "tobias"
  }
}

provider "aws" {
  region = var.region
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}
