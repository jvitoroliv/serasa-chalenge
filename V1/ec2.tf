//configuração da ec2 que será utilizada para rodar a aplicação

resource "aws_instance" "AWSLXTESTE" {
  ami             = var.ami 
  instance_type   = var.instance_type
  key_name        = var.key
  subnet_id       = aws_subnet.tf_subnet.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.tf-sg.id]
  tags = {
    Name = var.name
    Environment = var.env
    Provisioner = "Terraform"
    Product = "Aplicação Go"
    Description = "Desafio serasa"
  }
}  


