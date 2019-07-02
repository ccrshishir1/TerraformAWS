resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.publicCIDRblock
    availability_zone = var.publicAZ
    map_public_ip_on_launch = true
}

resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public1CIDRblock
    availability_zone = var.public1AZ
    map_public_ip_on_launch = true
}


resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.privateCIDRblock
    availability_zone = var.privateAZ
}

resource "aws_eip" "nat" {}


resource "aws_nat_gateway" "private_nat" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public.id 
}
  

