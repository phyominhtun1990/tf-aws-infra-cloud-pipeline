output "instance_public_ip_addr" {
  value = module.ec2_cluster[*].public_ip
  description = "Instance Public IP Address"
}

output "instance_public_dns" {
  value = module.ec2_cluster[*].public_dns
  description = "Instance Public DNS"
}