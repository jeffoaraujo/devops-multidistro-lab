# DevOps Multi-Distribuição & Automação de Infraestrutura (Lab)

Laboratório prático de engenharia DevOps estruturado em **macOS** para automação de provisionamento, gestão de identidades (PAM), controle de acesso baseado em função (RBAC) e orquestração de infraestrutura em múltiplas distribuições Linux simultaneamente (**Ubuntu Server**, **Rocky Linux** e **openSUSE**)[span_3](start_span)[span_3](end_span)[span_4](start_span)[span_4](end_span).

---

## 🎯 Objetivo do Projeto
Demonstrar competência avançada na criação de automações agnósticas, seguras e idempotentes utilizando **Ansible** e **Terraform**, garantindo paridade operacional e blindagem de credenciais em ambientes heterogêneos[span_5](start_span)[span_5](end_span)[span_6](start_span)[span_6](end_span).

---

## 🏗️ Topologia e Tecnologias
*   **Workstation de Controle:** macOS (Apple Silicon ARM64) com POSIX/Unix nativo[span_7](start_span)[span_7](end_span).
*   **Orquestração e Automação:** Ansible (Playbooks modulares e idempotentes)[span_8](start_span)[span_8](end_span)[span_9](start_span)[span_9](end_span).
*   **Infraestrutura como Código (IaC):** Terraform (Provedores locais e gerenciamento de estado)[span_10](start_span)[span_10](end_span).
*   **Ambiente de Testes:** Docker Desktop com containers multi-distro isolados[span_11](start_span)[span_11](end_span)[span_12](start_span)[span_12](end_span).
*   **Controle de Versão:** Git e GitHub[span_13](start_span)[span_13](end_span)[span_14](start_span)[span_14](end_span).

---

## 🔒 Padrões de Segurança Implementados
1. **Zero Plaintext Passwords:** Todas as senhas das contas de serviço são criptografadas utilizando hashes **SHA-512** de alta entropia (gerados via módulo nativo `crypt` do Python), blindando o código-fonte e o histórico de commits[span_15](start_span)[span_15](end_span)[span_16](start_span)[span_16](end_span).
2. **Validação de Sintaxe Prévia (`visudo`):** A manipulação do arquivo `/etc/sudoers` para liberação dos grupos corporativos (`%linux_adm`, `%mdw_adm`, `%infra_adm`, `%dba_adm`) é validada automaticamente por segurança (`visudo -cf`) antes de ser aplicada nos servidores[span_17](start_span)[span_17](end_span)[span_18](start_span)[span_18](end_span).
3. **Princípio do Menor Privilégio:** Contas de serviço estruturadas por funções corporativas específicas (`_01` e `_02`), segmentando o acesso operacional[span_19](start_span)[span_19](end_span)[span_20](start_span)[span_20](end_span).

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
