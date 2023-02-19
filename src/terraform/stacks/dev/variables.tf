variable stack {
    default = "dev"
}

variable project_id {
    default = "arminius-demo-dev"
}

variable region {
    default = "asia-northeast1"
}

variable zone {
    default = "asia-northeast1-c"
}

variable server_port {
    default = 8388
}

variable password {
    sensitive = true
}

variable method {
    default = "chacha20-ietf-poly1305"
    sensitive = true
}