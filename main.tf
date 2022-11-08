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

resource "aws_instance" "my_ec2" {
    ami = var.ec2_amiid
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "id_rsa"
    vpc_security_group_ids = "sg-06ca35c08399b1122"
    subnet_id = "us-west-2a"
    tags = {
      "Name" = "my_ec2"
    }

    depends_on = [
      aws_vpc.my_vpc
    ]

}