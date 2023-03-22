# output nat_ip {
#     value = module.compute.shadowsocks.network_interface[0].access_config[0].nat_ip
# }
output network_interface {
    value = module.compute.network_interface
}