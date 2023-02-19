resource "google_cloud_run_service" "shadowsocks" {
  name     = "shadowsocks-libev"
  location = var.region

    template {
        spec {
            containers {
                image = "shadowsocks/shadowsocks-libev"
            }
        }
    }
}