resource "aws_vpc_peering_connection" "db-access" {
  vpc_id        = "${var.proitzenvpc}"
  peer_vpc_id   = "${aws_vpc.proitzen_as_vpc.id}"
  peer_owner_id = "${var.account_id}"

  tags {
    Name = "db-access"
  }

  auto_accept = true
}

