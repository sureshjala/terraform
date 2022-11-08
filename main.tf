resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
    tags = {
      "Name" = "my_vpc"
    }
  
}
resource "aws_subnet" "subnets" {
    count = 2
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnets_cidr_block[count.index]
  availability_zone = var.az[count.index]

  tags = {
    "Name" = var.subnets_name[count.index]
  }
}
