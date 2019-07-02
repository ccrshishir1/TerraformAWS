resource "aws_security_group" "allow_ssh" {
    vpc_id = aws_vpc.main.id
    name = "design_allow_ssh"
    description = "allow ssh connection to public subnet"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}

resource "aws_security_group" "no_ssh" {
    vpc_id = aws_vpc.main.id 
    name = "design_no_ssh"
    description = "do not allow ssh for private"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
    
}

resource "aws_security_group_rule" "ingresstoprivate" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    security_group_id = aws_security_group.no_ssh.id
    source_security_group_id = aws_security_group.allow_ssh.id
}

