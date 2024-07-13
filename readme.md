# FiapBurger EKS Infrastructure

Este repositório contém a infraestrutura como código (IaC) para provisionar um cluster Kubernetes no Amazon EKS, que suporta a aplicação FiapBurger, um sistema de gerenciamento de pedidos para uma lanchonete.

## Comandos terraform

terraform init && terraform plan





## Estrutura do Repositório

```
src
├── eks 
│  ├── eks-access.tf
│  ├── eks-node-group.tf
│  ├── eks-security.tf
│  ├── eks.tf
│  └── variables.tf
├── main.tf
├── provider.tf
└── vars.tf
```

## Funcionalidades de Negócio

A aplicação FiapBurger implementa as seguintes funcionalidades:

- **Gerenciamento de Pedidos**: Criação, atualização e monitoramento de pedidos de clientes.
- **Catálogo de Produtos**: Manutenção de um catálogo de produtos disponíveis para pedido.
- **Gestão de Clientes**: Administração de informações dos clientes, incluindo registro e histórico de pedidos.
- **Monitoramento e Histórico**: Acompanhamento do status dos pedidos e registro histórico das transações.

## Como Usar

### Pré-requisitos

- Terraform instalado.
- AWS CLI configurado com acesso à sua conta AWS.
- kubectl configurado para interagir com seu cluster Kubernetes.

### Configuração e Implantação
1. **Provisionar o Cluster EKS**:
    - Navegue até `terraform/eks`.
    - Execute `terraform init` e `terraform apply` para criar o cluster EKS.

2. **Configurar e Aplicar Recursos do Kubernetes**:
    - Use `kubectl apply -f kubernetes/deployments/`, `kubectl apply -f kubernetes/services/`, e `kubectl apply -f kubernetes/ingress/` para implantar sua aplicação no cluster EKS.

### Atualizações

- Para atualizar a aplicação, faça push das alterações para o repositório e deixe o pipeline de CI/CD automatizar o processo de build e deployment.

## CI/CD

O pipeline de CI/CD definido em `.github/workflows/` automatiza:

- O processo de teste e build da aplicação.
- A implantação de infraestrutura usando Terraform.
- A aplicação das configurações do Kubernetes no cluster EKS.

## Contribuindo

Para contribuir com o projeto:

1. Faça um fork do repositório.
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`).
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`).
4. Push para a branch (`git push origin feature/AmazingFeature`).
5. Crie um Pull Request.

## Link do Repositório

[FiapBurger EKS Infrastructure](https://github.com/FiapBurger/fiap-burger-infra-eks)
