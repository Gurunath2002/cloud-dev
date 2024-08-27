resource "aws_instance" "guru" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    key_name = "dev"
    subnet_id = aws_subnet.cust.id
    vpc_security_group_ids = [aws_security_group.aws_tls.id]
    availability_zone = "us-east-1a"
  
}
