output "instance_public_ip_addr" {
  value = this.*.public_ip
  description = "Instance Public IP Address"
}

output "instance_public_dns" {
  value = this.*.public_dns
  description = "Instance Public DNS"
}