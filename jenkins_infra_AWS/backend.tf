terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "terraform.tfstate"
    region         = ""
    dynamodb_table = "terraform-lock"
  }
}
