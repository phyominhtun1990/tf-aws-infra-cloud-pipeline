output "instance_public_ip_addr" {
  value = ec2_cluster.this.*.public_ip
  description = "Instance Public IP Address"
}

output "instance_public_dns" {
  value = ec2_cluster.this.*.public_dns
  description = "Instance Public DNS"
}