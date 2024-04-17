variable region {
    type = string
    description = "Provide region"
}

variable vpc_cidr {
 type = list(object({
   cidr_block = string 
   dns_hostnames = bool
   dns_support = bool
 }))
}

variable subnet_cidr {
 type = list(object({
    cidr = string
    subnet_name = string
 }))
}

variable rt_names {
   type = list(string)
   default = [ "public-rt", "private-rt" ]
}

variable ip_on_launch {
    type = bool
    default = false
}

variable "ec2_types" {
  description = "List of EC2 instance types"
  type        = list(object({
    ami       = string
    instance_type = string
    ec2_name          = string
  }))
}

variable igw_name {
   type = string
   default = "homework5_igw"
}

variable "open_ports" {
  default = [22, 80]
}