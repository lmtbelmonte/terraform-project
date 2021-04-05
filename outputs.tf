output "PrivateIP" {
  description = "IP privada de la instancia EC2"
  value       = aws_instance.my-instance.private_ip
}