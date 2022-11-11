variable "cidr_block" {
    type = string
    default = "10.10.0.0/16"
  
}
variable "aws_subnet_cidr" {
    type = string
    default = "10.10.0.0/24"
  
}
variable "availability_zone" {
    type = string
    default = "us-west-2a"

  
}
variable "app-trigger" {
    type = string
    description = "giving the trigger to the null resource"
    default = "1.0"
}
