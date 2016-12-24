# Internet VPC
resource "aws_vpc" "proitzen_as_vpc" {
    cidr_block = "192.168.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "proitzen_as_vpc"
    }
}

# Subnets

resource "aws_subnet" "public_sub_01" {
    vpc_id = "${aws_vpc.proitzen_as_vpc.id}"
    cidr_block = "192.168.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-2a"
    tags {
	Name = "as-192.168.1.0-ap-southeast-2a"
	}
}

resource "aws_subnet" "public_sub_02" {
    vpc_id = "${aws_vpc.proitzen_as_vpc.id}"
    cidr_block = "192.168.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-2b"
    tags {
        Name = "as-192.168.2.0-ap-southeast-2b"
        }
}

# IGW

resource "aws_internet_gateway" "igw-main" {
    vpc_id = "${aws_vpc.proitzen_as_vpc.id}"
    tags {
	Name = "igw-main"
	}
}

# route table

resource "aws_route_table" "public_route" {
    vpc_id = "${aws_vpc.proitzen_as_vpc.id}"
    route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.igw-main.id}"
	}
    route {
        cidr_block = "10.0.0.0/16"
        vpc_peering_connection_id = "${aws_vpc_peering_connection.db-access.id}"
        }
    tags {
	Name = "public_route"
	}
}


# route associations public

resource "aws_route_table_association" "public_sub_route1" {
    subnet_id = "${aws_subnet.public_sub_01.id}"
    route_table_id = "${aws_route_table.public_route.id}"
}

resource "aws_route_table_association" "public_sub_route2" {
    subnet_id = "${aws_subnet.public_sub_02.id}"
    route_table_id = "${aws_route_table.public_route.id}"
}














