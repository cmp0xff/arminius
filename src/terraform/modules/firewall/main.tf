resource google_compute_firewall allow_shadowsocks {
    project = var.project_id
    name = "allow-shadowsocks"
    network = var.network
    description = "123"

    source_ranges = ["0.0.0.0/0"]

    allow {
        protocol = "TCP"
        ports = [var.port]
    }
    allow {
        protocol = "UDP"
        ports = [var.port]
    }

    target_tags = var.target_tags
}