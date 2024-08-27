resource "aws_instance" "test" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    availability_zone = "us-east-1d"
    key_name = "awsaws"

    tags = {
      Name = "test"
    }
}
terraform {
  backend "s3" {
    bucket = "mybucket"
    key = "path/to/my/key"
    region = "us-east-"
    
  }
}