variable "ami" {
    type = string
    default = "ami-03e35955609fba859"
  
}

variable "chassis" {
    type = string
    default = "t2.micro"
}

variable "key" {
    type = string
    default = "key1"
  
}

variable "num_of_ec2" {
    type = number
    default = 4
}

variable "sg-id" { }
variable "subnet" {}