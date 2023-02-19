# resource "google_cloud_run_service" "shadowsocks" {
#     name     = "shadowsocks-libev"
#     location = var.region

#     template {
#         spec {
#             containers {
#                 image = "docker.io/shadowsocks/shadowsocks-libev:latest"
#                 ports {
#                     container_port = 8388
#                 }
#                 env {
#                     name = "PASSWORD"
#                     value = "123"
#                 }
#             }
#         }
#     }
#     metadata {
#         labels = {
#             "stack" = "dev"
#         }
#     }
# }

# resource "google_cloud_run_service_iam_policy" "noauth" {
#     location    = google_cloud_run_service.shadowsocks.location
#     project     = google_cloud_run_service.shadowsocks.project
#     service     = google_cloud_run_service.shadowsocks.name

#     policy_data = var.run_noauth.policy_data
# }