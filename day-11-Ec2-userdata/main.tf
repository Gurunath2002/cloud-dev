provider "aws" { 
}
resource "aws_instance" "dev" {
    ami = "ami-0ae8f15ae66fe8cda"
    instance_type = "t2.micro"
    user_data= file("test.sh")
}