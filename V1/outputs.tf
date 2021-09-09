//Output responsável por expor o endereço para conexão na máquina
output "instance_public_ip" {
  value       = aws_eip.ip-env.public_ip
  description = "O ip publico gerado para a instancia ec2"
}


