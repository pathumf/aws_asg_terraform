resource "aws_launch_configuration" "lg_config" {
  name_prefix          = "${var.lg_name}"
  image_id             = "${var.AMI_ID}"
  instance_type        = "t2.micro"
  key_name             = "${var.key_lg}"
  security_groups      = ["${aws_security_group.app_sg.id}"]
  iam_instance_profile = "S3_Role1"
  associate_public_ip_address = true
  user_data            = "sudo service awslogs start"
  lifecycle              { 
	create_before_destroy = true 
	}
}

resource "aws_autoscaling_group" "asg_config" {
  name                 = "${var.asg_name}"
  vpc_zone_identifier  = ["${aws_subnet.public_sub_01.id}","${aws_subnet.public_sub_02.id}"]
  launch_configuration = "${aws_launch_configuration.lg_config.name}"
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2 
  health_check_grace_period = 300
  health_check_type = "ELB"
  target_group_arns = ["${aws_alb_target_group.ag_target1.arn}"]
  force_delete = true

  tag {
      key = "Name"
      value = "ec2 instance"
      propagate_at_launch = true
  }
}
