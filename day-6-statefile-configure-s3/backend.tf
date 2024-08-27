terraform {
  backend "s3" {
    bucket = "naresh_devops_awsdevops"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    }
}