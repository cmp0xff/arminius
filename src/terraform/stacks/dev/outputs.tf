output nat_ip {
    value = module.compute.shadowsocks.network_interface[0].access_config[0].nat_ip
}