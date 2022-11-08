variable "aws_region" {
    type = string
    default = "us-west-2"
  
}
variable "cidr_block" {
    type = string
    default = "10.10.0.0/16"
  
}
variable "subnets_cidr_block" {
    type = list(string)
    default = [ "10.10.0.0/24","10.10.1.0/24" ]
}
variable "subnets_name" {
    type = list(string)
    default = [ "subnet1","subnet2" ]
  
}
variable "az" {
     type = list(string)
     default = [ "us-west-2a","us-west-2b" ]
  
}
variable "ec2_amiid" {
    type = string
    default = "ami-017fecd1353bcc96e"
  
}