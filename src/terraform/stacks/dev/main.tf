module "marketplace" {
    source = "../../modules/marketplace"

    project_id = var.project_id
    region = var.region
}

module "run" {
    source  = "../../modules/run"

    project_id = var.project_id
    region = var.region

    depends_on = [
        module.marketplace
    ]
}