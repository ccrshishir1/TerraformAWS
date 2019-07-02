resource "aws_launch_configuration" "weblc" {
    image_id = var.asgami[var.region]
    instance_type = var.webinstancetype
    security_groups = [aws_security_group.allow_ssh.id]
    key_name = "WP-Key"
    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 80 &
              EOF
    lifecycle  {
        create_before_destroy = "true"
    }
}

resource "aws_launch_configuration" "databaselc" {
    image_id = var.asgami[var.region]
    instance_type = var.webinstancetype
    security_groups = [aws_security_group.no_ssh.id] 
    lifecycle  {
        create_before_destroy = "true"
    }
}