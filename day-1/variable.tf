variable "aws" {
    description = "inserting ami values to main.tf"
    type = string
    default = "ami-066784287e358dad1"  
}
  
variable "type" {
    description = "inserting ami values to main.tf"
    type = string
    default = "t2.micro"
  
}

variable "key" {
    type = string
    default = "aws_key"  
}