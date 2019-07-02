resource "aws_vpc" "main" {
    cidr_block = var.CIDR_BLOCK

    tags = {
        Name = "Design_1"
    }
}

resource "aws_internet_gateway" "DesignGW" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "Design_IGW"
    }
}

data "aws_availability_zones" "available" {
  state = "available"
}
