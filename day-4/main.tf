resource "aws_s3_bucket" "dev" {
    bucket = "naresh_devops_awss"
  
}
resource "aws_s3_bucket_versioning" "versioning_ecample" {
    bucket = aws_s3_bucket.dev.id
    versioning_configuration {
        status = "Enabled"
    }
  
}

