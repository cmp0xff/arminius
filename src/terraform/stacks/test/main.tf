module marketplace {
    source = "../../modules/marketplace"
}

module firewall {
    source = "../../modules/firewall"

    project_id = var.project_id

    depends_on = [
        module.marketplace
    ]
}

module compute {
    source = "../../modules/compute"

    stack = var.stack

    region = var.region
    zone = var.zone

    network = module.firewall.network
    port = module.firewall.port
    tags = module.firewall.target_tags

    method = var.method
    password = var.password

    depends_on = [
        module.marketplace
    ]
}