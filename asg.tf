resource "aws_autoscaling_group" "webasg" {
    launch_configuration = aws_launch_configuration.weblc.id
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

    vpc_zone_identifier = [aws_subnet.public.id]

    target_group_arns = [aws_lb_target_group.test.arn]

    health_check_type = "ELB"

    min_size = 2
    max_size = 10

    tags = [{
        key = "Name"
        value = "WEBASG"
        
        propagate_at_launch = true
    }]
}

resource "aws_autoscaling_group" "dbasg" {
    launch_configuration = aws_launch_configuration.databaselc.id
    availability_zones = ["us-east-1b", "us-east-1b", "us-east-1c"]

    vpc_zone_identifier = [aws_subnet.private.id]
    min_size = 2
    max_size = 10

    tags = [{
        key = "Name"
        value = "DBASG"
        
        propagate_at_launch = true
    }]
}