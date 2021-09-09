# serasa-chalenge
Desafio serasa para a subida automática de uma aplicação em uma instancia em cloud.
Antes da utilização é necessário atender a alguns requisitos.
São eles:
0 - Esta automação foi desenvolvida utilizando uma máquina com sistema operacional linux, logo o passo a passo e todos os comandos serão baseados na utilização através do linux.

1 - Possuir uma conta na aws, caso não possua, é possível criar através do link abaixo:
https://www.google.com/aclk?sa=L&ai=DChcSEwjq8_Pm7PLyAhUICJEKHTysBLAYABABGgJjZQ&sig=AOD64_14ANiCTAajp1T9x2hSYceo7EzdSA&q&adurl&ved=2ahUKEwiL1Orm7PLyAhXpq5UCHYBOCDwQ0Qx6BAgDEAE

2 - Criar uma conta no IAM para obter as credenciais:
https://docs.aws.amazon.com/pt_br/IAM/latest/UserGuide/id_users_create.html
Obs: Foi utilizado um usuário com permissões de administrador para essa automação, necessário
ficar atento pois caso as permissões sejam diferentes, podem ocorrer problemas.

3 - Possuir as credenciais devidamente configuradas na máquina:
https://docs.aws.amazon.com/pt_br/rekognition/latest/dg/setup-awscli-sdk.html
Vale a pena conferir também a instalação do AWS CLI
https://docs.aws.amazon.com/pt_br/cli/latest/userguide/install-cliv2-linux.html

4 - Ter o terraform instalado na máquina
https://learn.hashicorp.com/tutorials/terraform/install-cli

5 - Ter o Ansible instalado na máquina
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
Obs: A documentação acima tem a dependencia da instalação do Python e do pip
https://python.org.br/instalacao-linux/

6 - Criar/Ter uma chave pem na conta aws
https://docs.aws.amazon.com/pt_br/AWSEC2/latest/WindowsGuide/ec2-key-pairs.html

Para utilizar a automação, é necessário realizar o clone local deste repositório.

Após realizar o clone siga os passo abaixo:

1. Navegue até a pasta V1

2. Abra o arquivo variables.tf
2.1. Este arquivo é onde se encontram todas as váriaveis utilizadas nos módulos do terraform
para criação da instancia.
2.2. Existem comentarios indicando três variáveis cuja alteração do valor são obrigatórias
São elas:
- A Chave que a máquina ira utilizar ao ser construída (nome)
- O local/arquivo_key.pem o da key.pem baixada após a criação da aws
- O local onde se encontra o arquivo credentials da aws
A modificação das outras variáveis são opicionais, porém sempre é interessante avaliar

3. Dentro do diretório V1 Execute o comando terraform init para instalar todos os plugins e dependencias do terraform.

4. Execute o comando terraform plan para verificar se está tudo pronto para utilizar o terraform.

5. Execute o terraform Apply e digite yes para executar o terraform.

6. Após a construção o terraform irá indicar um output com o ip elastico publico da máquina criada na aws, execute o comando ssh -i local/arquivo_key.pem ec2-user@Ip_exibido_pelo_terraform
Lembrando que ec2-user é o usuário padrão da AMI utilizada, caso utilize outra será necessário realizar alguns ajustes nos arquivos .tf e .yaml

7. dentro da máquina execute o comando curl http://localhost:8080 para validar a subida e execução da aplicação main.go

Obs: Até o momento hoveram problemas na exposição da aplicação por isso o passo 7 para a internet e o controle de versão ainda não foi implementado.

Considerações finais: Para features futuras, além da correção das dependencias, algumas possíbilidades são adicionar as automações em esteira CI/CD no git lab para facilitar todo o processo.

Atte.,



