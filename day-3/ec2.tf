resource "aws_instance" "prod" {
    ami = "ami-0ae8f15ae66fe8cda"
    instance_type = "t2.micro"
    key_name = "aws_key"
    subnet_id = aws_subnet.cust.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    availability_zone = "us-east-1a"
  
}
