data google_compute_image debian_image {
    family = "debian-11"
    project = "debian-cloud"
}

resource google_compute_address libev_v4 {
    name = "libev-v4"
    region = var.region
}

resource google_compute_instance libev {
    name = "shadowsocks-libev"
    zone = var.zone

    machine_type = var.machine_type

    boot_disk {
        initialize_params {
            image = data.google_compute_image.debian_image.self_link
        }
    }

    network_interface {
        network = var.network
        access_config {
            nat_ip = google_compute_address.libev_v4.address
        }
    }

    tags = concat(var.tags, [var.zone])

    metadata_startup_script = templatefile(
        "${ path.module }/configs/libev-startup.sh.tftpl", {
            config = jsonencode(yamldecode(templatefile(
                "${ path.module }/configs/libev-config.yaml.tftpl", {
                    port = var.port
                    password = var.password
                    method = var.method
                }
            )))
        }
    )

    labels = {
        stack = var.stack
        region = var.region
        zone = var.zone
    }
}
