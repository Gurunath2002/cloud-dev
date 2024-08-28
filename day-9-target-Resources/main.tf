resource "aws_instance" "dependent" {
    ami = "ami-0ae8f15ae66fe8cda"
    instance_type = "t2.micro"
    key_name = "public"
  
}

resource "aws_s3_bucket" "dependent" {
    bucket = "s3nareshtarget"
  
}