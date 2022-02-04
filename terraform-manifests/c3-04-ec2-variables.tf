
variable "instance_type_bastion" {
  description = "Bastion EC2 Instance type"
  type = string
  default = "t2.micro"
}

variable "instance_type_private" {
  description = "Private EC2 Instance type"
  type = string
  default = "t2.small"
}

variable "kpname" {
  description = "Key pair name"
  type = string
  default = "ammykpireland"
}

variable "private_instance_count" {
  description = "Number of EC2 instance in the private subnet"
  type = number
  default = "1"
}
