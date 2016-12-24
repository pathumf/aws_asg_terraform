variable "AWS_REGION" {
  default = "ap-southeast-2"
}
variable "lg_name" {
  default = "blue-lg"
}
variable "key_lg" {
  default = "webserverkey"
}
variable "asg_name" { 
  default = "blue-asg"
}

variable "server_certificate" {
  default = "newkinderm8one"
}

variable "proitzenvpc" {
  default = "vpc-0c55c569"
}
variable "account_id" {}

variable "ag_target" {}
