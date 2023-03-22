variable stack {
    default = "prod"
}

variable project_id {
    default = "arminius-demo-prod"
}

variable region {
    default = "asia-east2"
    # default = "europe-west1"
}

variable zone {
    default = "asia-east2-c"
    # default = "europe-west1-c"
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