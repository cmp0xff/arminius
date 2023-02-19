resource google_compute_address static {
    name = "ipv4-address"
    region = var.region
}

data google_compute_image debian_image {
    family = "debian-11"
    project = "debian-cloud"
}

resource google_compute_instance shadowsocks {
    name = var.instance_name
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
            nat_ip = google_compute_address.static.address
        }
    }

    tags = concat(var.tags, [var.zone])

    metadata_startup_script = templatefile(
        "${ path.module }/configs/ss-startup.sh.tftpl", {
            config = jsonencode(yamldecode(templatefile(
                "${ path.module }/configs/ss-config.yaml.tftpl", {
                    port = var.port
                    password = var.password
                    method = var.method
                }
            )))
            default = file("${ path.module }/configs/ss-default.sh")
        }
    )

    labels = {
        stack = var.stack
        region = var.region
        zone = var.zone
    }
}
