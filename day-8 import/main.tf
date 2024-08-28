resource "aws_instance" "test" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    key_name = "north"
    tags = {
      Name = "EKs"
    }
}