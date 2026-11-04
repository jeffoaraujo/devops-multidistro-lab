# Configuração do Provedor e Versão do Terraform
terraform {
  required_version = ">= 1.7.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

# Configuração do Provedor (exemplo inicial usando o provider local)
provider "local" {}

# Recurso de Teste: Criando um arquivo de configuração inicial via Terraform
resource "local_file" "smoke_test" {
  filename = "${path.module}/output_teste.txt"
  content  = "Laboratorio Terraform configurado com sucesso no Mac Apple Silicon!"
}

# Output para exibir o status após o apply
output "status_mensagem" {
  value = "Infraestrutura local provisionada com sucesso: ${local_file.smoke_test.filename}"
}
