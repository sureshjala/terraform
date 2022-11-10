variable "cidr_block" {
    type = list(string)
    default = [ "10.10.0.0/16","198.168.0.0/16" ]
  
}
variable "tags" {
    type = list(string)
    default = [ "my_vpc1","my_vpc2" ]  
}
variable "cidr_block_frst_subnet" {
    type = list(string)
    default = [ 
    "10.10.0.0/24",
    "10.10.1.0/24",
    "10.10.2.0/24",
    "10.10.3.0/24",
    "198.168.0.0/24",
    "198.168.1.0/24",
    "198.168.2.0/24",
    "198.168.3.0/24" ]
}
variable "availability_zone_frst_subnet" {
    type = list(string)
    default = [ 
    "us-west-2a",
    "us-west-2a",
    "us-west-2a",
    "us-west-2a",
    "us-west-2b",
    "us-west-2b",
    "us-west-2b",
    "us-west-2b" ]
  
}
variable "frst_sub_names" {
    type = list(string)
    default = [ 
    "sub1","sub2",
    "sub3","sub4",
    "sub5","sub6",
    "sub7","sub8" ]
  
}