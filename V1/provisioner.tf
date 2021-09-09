//Configuração responsável por acionar o ansible após o provisionamento da AWS realizado pelo terraform
resource "null_resource" "previous" {}

//recurso responsável por aguardar a instancia estar pronta para a execução do ansible
resource "time_sleep" "wait_some_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "250s"
}

//recurso responsável pela execução do ansible na instancia criada
resource "null_resource" "ansible" {
     //conexão com ansible
  depends_on = [time_sleep.wait_some_seconds]

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file(var.ssh_key_private)}"
      host        = aws_eip.ip-env.public_dns
    }
  }
//Comando responsável pela execução do ansible
  provisioner "local-exec" {
    command = "ansible-playbook -u ec2-user -i '${aws_eip.ip-env.public_ip},' --private-key ${var.ssh_key_private} provision.yml" 
  }  
}