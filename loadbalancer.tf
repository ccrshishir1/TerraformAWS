resource "aws_lb" "example_elb" {
    name = "example"
    #availability_zones = ["data.aws_availability_zones.all.names"]
    subnets = ["${aws_subnet.public.id}", "${aws_subnet.public1.id}"]
    security_groups = [aws_security_group.allow_ssh.id]
    load_balancer_type = "application"  
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.main.id}"
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.example_elb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.test.arn}"
  }
}
