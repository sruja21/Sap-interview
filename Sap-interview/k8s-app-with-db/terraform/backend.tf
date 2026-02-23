
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "rds/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
