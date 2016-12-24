#lb security group

resource "aws_security_group" "lb_sg" {
  description = "controls access to the application ELB"

  vpc_id = "${aws_vpc.proitzen_as_vpc.id}"
  name   = "lbsg"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

#app security group

resource "aws_security_group" "app_sg"{
   vpc_id = "${aws_vpc.proitzen_as_vpc.id}"
   name = "app_sg"
   description = "security group that allows ssh and all egress traffic"
   egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    ingress {
        from_port = "7070"
        to_port = "7070"
        protocol = "tcp"
        security_groups = ["${aws_security_group.lb_sg.id}",]
        }
    tags {
        Name = "app_sg"
  }
}
