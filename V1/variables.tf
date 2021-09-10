//Configuração das variáveis utilizadas pelos modulos do terraform
variable "region" {
  description = "Define em qual região a instancia será criada"
  default = "us-east-2"
}

variable "name" {
  description = "Nome da aplicação"
  default = "AWSLXTESTE"
}

variable "env" {
  description = "Ambiente da aplicação"
  default = "dev"
}

variable "ami" {
  description = "AWS AMI que será usada "
  default = "ami-00dfe2c7ce89a450b"
}

variable "instance_type" {
  description = "Configuração de hardware da instancia"
  default = "t2.micro"
}

variable "profile" {
  description = "Profile de acesso utilizado para acessar a aws"
  default = "default"
}

variable "availability_zone" {
  description = "A zona de disponibilidade a ser usada no SG"
  default = "us-east-2a"
}

variable "remote_user" {
  description = "Usuário para acessar a instancia"
  default = "ec2-user"
}


//É necessario alterar as variáveis abaixo para o funcionamento correto do terraform, a alteração
//das variáveis acima são opcionais, porém é recomendado avaliar 
variable "key" {
  description = "Chave pem utilizada para acesso a instancia"
  default = "Sua_key_criada_na_aws"
}

variable "ssh_key_private" {
  description = "Chave privada para acesso a instancia ec2"
  default = "/local_da_chave/sua_key.pem"
}

variable "credentials" {
  description = "local das credenciais utilizadas para acessar a aws"
  default = "/home/${USER}/.aws/credentials"
}