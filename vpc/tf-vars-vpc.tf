variable "cidr" {
  type = string
  default = "192.168.0.0/16"
}

variable "cidr_blocks" {
    type = list(string)
    default = [ "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24" ]
  
}

variable "availability_zones"{
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}