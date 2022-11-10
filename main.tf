resource "aws_vpc" "name" {
    count = 2
    cidr_block = var.cidr_block[count.index]
    tags = {
    "Name" = var.tags[count.index]
  }
}
resource "aws_subnet" "name" {
    count = 8
    vpc_id = "${element(aws_vpc.name.*.id, count.index)}"
    cidr_block = var.cidr_block_frst_subnet[count.index]
    availability_zone = var.availability_zone_frst_subnet[count.index]
    tags = {
      "Name" = var.frst_sub_names[count.index]
    }
      depends_on = [
        aws_vpc.name
      ]
  
}