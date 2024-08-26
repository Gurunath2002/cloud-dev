#create vpc
resource "aws_vpc" "cust" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="dev"
    }
  
}
#create Internet gateway and attach to vpc
resource "aws_internet_gateway" "cust" {
    vpc_id = aws_vpc.cust.id
    tags = {
      Name ="cust_ig"
    }
  
}
# create subnet
resource "aws_subnet" "cust" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name ="cust_subnet"
    }

}
resource "aws_subnet" "cust2" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name ="cust_subnet"
    }

}
# create route table
resource "aws_route_table" "cust" {
    vpc_id = aws_vpc.cust.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cust.id
    
  }
}
# create subnet association and subnet into RT
resource "aws_route_table_association" "cust" {
    route_table_id = aws_route_table.cust.id
    subnet_id = aws_subnet.cust.id
}
# create security group
resource "aws_security_group" "aws_tls" {
    name = "allow_tls"
    vpc_id = aws_vpc.cust.id
    tags = {
      Name ="dev_sg"
    }
  
ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}

#Lanuch Instance
resource "aws_instance" "prod" {
    ami = "ami-0ae8f15ae66fe8cda"
    instance_type = "t2.micro"
    key_name = "aws_key"
    subnet_id = aws_subnet.cust.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
  
}



