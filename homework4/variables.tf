variable region {
    description = "Provide region"
    default = ""
    type = string
}
variable key_name {
    description = "Provide key name"
    default = "key_name"
    type = string
}
variable "aws_security_group_ids" {
  description = "Provide VPC security group IDs"
  type        = list(string)
  default     = []
}
variable ports {
    description = "Provide ports"
    type = list(number)
    default = [ 443, 80, 22 ]
}
variable availability_zone {
    description = "Provide availability zone"
    default = ""
    type = string
}
variable type {
    description = "Provide instance type"
    default = ""
    type = string
}
variable ami_id {
    description = "Provide ami id"
    default = ""
    type = string 
}

variable count_number {
    description = "Provide count number"
    default = "1"
    type = string
}