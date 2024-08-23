variable "ami" {
    description = "pasing the vaules to main.tf"
    type = string
    default = "ami-0ae8f15ae66fe8cda"
}
variable "instance_type" {
    type = string
    default = "t3.micro"
}
variable "key_name" {
    type = string
    default = "aws_key"  
}