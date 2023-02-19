variable stack {}

variable region {}
variable zone {}

variable network {}

variable port {}

variable instance_name {
    default = "shadowsocks"
}

variable "machine_type" {
    default = "f1-micro"
}

variable tags {}

variable password {
    sensitive = true
}

variable method {
    sensitive = true
}