# creating vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
}
# creating subnet in vpc
resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.aws_subnet_cidr
    availability_zone = var.availability_zone
    tags = {
      "Name" = "subnet1"
    }
    depends_on = [
      aws_vpc.my_vpc
    ]
# creating internet gateway for vpc 
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}
# creating route table 
resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.my_vpc.id
route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }
  depends_on = [
    aws_internet_gateway.igw
  ]
}
# attaching subnet to route table
resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rtb_public.id
  depends_on = [
    aws_route_table.rtb_public
  ]
}

# creating security group for vpc 
resource "aws_security_group" "my_sg" {
  name        = "my_sg"
    vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }
    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }
    ingress {
    from_port        = 4200
    to_port          = 4200
    protocol         = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_sg"
  }
  depends_on = [
    aws_vpc.my_vpc
  ]
}
# creating ec2 instance by using ec2 module
resource "aws_instance" "appec2" {
    ami = "ami-0d593311db5abb72b"
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "id_rsa"
    vpc_security_group_ids = [ aws_security_group.my_sg.id ]
    subnet_id = aws_subnet.subnet.id
    tags = {
      "Name" = "app"
    }
    depends_on = [
      aws_vpc.my_vpc,
      aws_security_group.my_sg
    ]

}
# creating null resource & provisioner for ec2 instance
resource "null_resource" "appprovisoner" {
  triggers = {
    running_number = var.app-trigger
  }

  provisioner "remote-exec" {

      connection {
      type = "ssh"  
      user = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host = ("aws_instance.app.public_ip")
    }
# installing angular application in ec2 instance
    inline = [
      "git clone https://github.com/gothinkster/angular-realworld-example-app.git",
      "cd angular-realworld-example-app", 
      "npm install -g @angular/cli", 
      "npm install"
    ]
  

    }
    depends_on = [
      aws_instance.appec2
    ]

}