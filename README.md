# 🚀 DemoDay - Projeto Final Bootcamp DevOps

## 📘 Descrição

Este projeto foi desenvolvido como parte do desafio final do Bootcamp de DevOps. A proposta consiste em aplicar práticas modernas de Integração Contínua (CI) e Entrega Contínua (CD) para resolver gargalos de deploy enfrentados por empresas em crescimento digital.

Nosso foco foi transformar um processo manual e arriscado de deploy em uma esteira DevOps automatizada, resiliente e escalável, garantindo agilidade sem comprometer a estabilidade do sistema.

---

## 🎯 Situação-Problema

A escola de idiomas **"Mundo Global"** lançou um Portal do Aluno para impulsionar seu crescimento digital. No entanto, a tecnologia virou um obstáculo:  
- O portal caía nos dias de matrícula, prejudicando a experiência dos alunos.  
- Cada atualização era lenta, manual e arriscada, demandando tempo excessivo da equipe técnica.  

O desafio era claro: **como inovar com velocidade e confiança?**  
Nosso projeto responde a essa pergunta com uma esteira de automação DevOps ponta a ponta.

---

## ✅ Solução Proposta

Criamos um pipeline completo de CI/CD para automatizar o fluxo de desenvolvimento da aplicação. Combinando **Docker**, **Docker Compose**, **GitHub Actions** e conceitos de **Infraestrutura como Código**, entregamos uma solução que permite:

- Build automatizado das imagens da aplicação;
- Testes integrados no pipeline;
- Publicação contínua de imagens no Docker Hub;
- Deploy automatizado com Docker Compose;
- Orquestração dos serviços de forma escalável e confiável.

O resultado: um portal **estável**, **ágil** e pronto para escalar com segurança.

---

## 🛠 Tecnologias e Ferramentas

Durante o projeto, utilizamos diversas ferramentas e tecnologias modernas do ecossistema DevOps:

- 🐳 **Docker** – Containerização de aplicações  
- ⚙️ **Docker Compose** – Orquestração local de múltiplos serviços  
- 🤖 **GitHub Actions** – Pipeline de CI/CD automatizado  
- 🔧 **Jenkins** – Automatização de builds e deploys em ambiente controlado  
- ☸️ **Kubernetes** – Orquestração de contêineres em produção  
- 📦 **Terraform** – Infraestrutura como Código (IaC)  
- ☁️ **AWS** – Hospedagem e escalabilidade em nuvem  
- 💻 **Git** – Controle de versão  
- 🌐 **HTML/CSS** – Interface do front-end

---
## 📁 Estrutura do Projeto
```bash
├── frontend/              # Interface HTML estática
├── api-saudacao/          # API de saudação
├── api-nome/              # API que retorna nomes aleatórios
├── .github/workflows/     # Pipeline CI/CD com GitHub Actions
├── docker-compose.yml     # Orquestração dos serviços
├── README.md              # Documentação do projeto
```
---

## 🚀 Como Executar o Projeto Localmente

> Pré-requisitos: Docker instalado e em execução

## 🚀 Como Executar o Projeto Localmente

Pré-requisitos: Docker instalado e em execução

### 1. Clone o repositório:

```bash
git clone https://github.com/karencinca/demoday-devops.git
cd demoday-devops
```
### 2. Execute com Docker Compose:
```bash
docker-compose up --build
```


## 👥 Autores

Este projeto foi desenvolvido em equipe para o bootcamp de DevOps:

- [Karen Cinca](https://github.com/karencinca)  
- [Bruna Yasmim](https://github.com/brwlly)  
- [Maisa Barbosa](https://github.com/maisabb)  

