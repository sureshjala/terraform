resource "aws_vpc" "frst_vpc" {

    cidr_block   = "192.168.0.0/16"

    tags = {
    "Name"         = "frst_VPC"
    }
}