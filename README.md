# 🚀 DevOps Multi-Distribuição & Automação de Infraestrutura (Lab)

Laboratório prático de engenharia DevOps estruturado em **macOS** para automação de provisionamento, gestão de identidades (PAM), controle de acesso baseado em função (RBAC) e orquestração de infraestrutura em múltiplas distribuições Linux simultaneamente (**Ubuntu Server**, **Rocky Linux** e **openSUSE**).

---

## 🎯 Objetivo do Projeto
Demonstrar competência avançada na criação de automações agnósticas, seguras e idempotentes utilizando **Ansible** e **Terraform**, garantindo paridade operacional e blindagem de credenciais em ambientes heterogêneos.

---

## 🏗️ Topologia e Tecnologias
* 💻 **Workstation de Controle:** macOS (Apple Silicon ARM64) com POSIX/Unix nativo.
* ⚙️ **Orquestração e Automação:** Ansible (Playbooks modulares e idempotentes).
* 🛠️ **Infraestrutura como Código (IaC):** Terraform (Provedores locais e gerenciamento de estado).
* 🐳 **Ambiente de Testes:** Docker Desktop com containers multi-distro isolados.
* 🐙 **Controle de Versão:** Git e GitHub.

---

## 🔒 Padrões de Segurança Implementados
1. **Zero Plaintext Passwords:** Todas as senhas das contas de serviço são criptografadas utilizando hashes **SHA-512** de alta entropia (gerados via módulo nativo openssl passwd -6), blindando o código-fonte e o histórico de commits.
2. **Validação de Sintaxe Prévia (`visudo`):** A manipulação do arquivo `/etc/sudoers` para liberação dos grupos corporativos (`%linux_adm`, `%mdw_adm`, `%infra_adm`, `%dba_adm`) é validada automaticamente por segurança (`visudo -cf`) antes de ser aplicada nos servidores.
3. **Princípio do Menor Privilégio:** Contas de serviço estruturadas por funções corporativas específicas (`_01` e `_02`), segmentando o acesso operacional.

---

## 📁 Estrutura do Repositório

```text
devops/
├── ansible/
│   ├── inventory/
│   │   └── hosts               # Mapeamento dos containers multi-distro
│   └── playbooks/
│       ├── setup-pam-users.yml # Playbook principal e idempotente
│       └── vars/
│           └── users-data.yml  # Cofre de variáveis e hash SHA-512
└── terraform/
    └── *.tf                    # Configurações declarativas de infraestrutura
