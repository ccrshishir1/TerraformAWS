resource "aws_route_table" "privateroute" { 
    vpc_id = aws_vpc.main.id
    route {
        
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.private_nat.id

    }
    #depends_on = aws_internet_gateway.DesignGW.id
    tags = {
        Name = "main"
    }
}

resource "aws_route_table" "publicroute" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.DesignGW.id
    }
    tags = {
        Name = "Custom"
    }
}

resource "aws_route_table_association" "privateassociation" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.privateroute.id
}

resource "aws_route_table_association" "publicassociation" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.publicroute.id
}