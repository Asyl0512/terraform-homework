variable region {
    type = string
    description = "Provide region"
}

variable vpc_cidr {
    type = string
    description = "Provide vpc cidr block"
}

variable public1_cidr {
    type = string
    description = "Provide public1 cidr block"
}

variable public2_cidr {
    type = string
    description = "Provide public2 cidr block"
}

variable private1_cidr {
    type = string
    description = "Provide private1 cidr block"
}

variable private2_cidr {
    type = string
    description = "Provide private2 cidr block"
}

variable rt_names {
   type = list(string)
   default = [ "public-rt", "private-rt" ]
}

variable ip_on_launch {
    type = bool
    default = false
}

variable instance_type {
    type = string
}

variable enable_dns_support {
    type = bool
}

variable enable_dns_hostnames {
    type = bool
}

variable igw_name {
   type = string
   default = "homework5_igw"
}

variable "open_ports" {
  default = [22, 80]
}