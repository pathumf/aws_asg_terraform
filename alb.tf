#TG
resource "aws_alb_target_group" "ag_target1" {
  name     = "${var.ag_target}"
  port     = 7070
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.proitzen_as_vpc.id}"
  health_check {
	path = "/server/status"
	
  }
}

resource "aws_alb" "alb_app" {
  name            = "alb-app"
  subnets         = ["${aws_subnet.public_sub_01.id}","${aws_subnet.public_sub_02.id}"]
  security_groups = ["${aws_security_group.lb_sg.id}"]
}

resource "aws_alb_listener" "front_end_80" {
  load_balancer_arn = "${aws_alb.alb_app.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.ag_target1.arn}"
    type             = "forward"
  }
}
/* resource "aws_alb_listener" "front_end_443" {
  load_balancer_arn = "${aws_alb.alb_app.id}"
  port              = "443"
  protocol          = "HTTPS"
  default_action {
    target_group_arn = "${aws_alb_target_group.ag_target1.arn}"
    type             = "forward"
  }
} */
