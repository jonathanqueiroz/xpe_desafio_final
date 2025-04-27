# Sistema de Gerenciamento de Pedidos

API REST desenvolvida em Ruby on Rails para gerenciamento de clientes, produtos e pedidos.

## Sobre o Projeto

Este projeto é uma API REST que fornece endpoints para gerenciamento completo de um sistema de pedidos, incluindo:
- Gerenciamento de Clientes
- Gerenciamento de Produtos
- Gerenciamento de Pedidos

## Tecnologias Utilizadas

- Ruby 3.x
- Rails 8.0.0
- PostgreSQL 16
- Docker e Docker Compose
- Puma como servidor web

## Requisitos

- Docker
- Docker Compose
- Git

## Configuração do Ambiente

### 1. Clone o Repositório

```bash
git clone https://github.com/jonathanqueiroz/xpe_desafio_final
cd xpe_desafio_final
```

### 2. Iniciar o Projeto com Docker Compose

```bash
docker-compose up --build
```

O projeto estará disponível em `http://localhost:3000`

### 3. Configuração do Banco de Dados

O banco de dados será criado e configurado automaticamente. Para criar e migrar o banco:

```bash
docker-compose exec api rails db:create db:migrate
```

## Estrutura da API

### Endpoints

#### Clientes
- `GET /api/v1/clients` - Lista todos os clientes
- `GET /api/v1/clients/:id` - Detalhes de um cliente
- `POST /api/v1/clients` - Criar novo cliente
- `PUT /api/v1/clients/:id` - Atualizar cliente
- `DELETE /api/v1/clients/:id` - Remover cliente
- `GET /api/v1/clients/search?name=` - Buscar clientes por nome
- `GET /api/v1/clients/count` - Contabiliza o número de clientes

#### Produtos
- `GET /api/v1/products` - Lista todos os produtos
- `GET /api/v1/products/:id` - Detalhes de um produto
- `POST /api/v1/products` - Criar novo produto
- `PUT /api/v1/products/:id` - Atualizar produto
- `DELETE /api/v1/products/:id` - Remover produto
- `GET /api/v1/products/search?name=` - Buscar produtos por nome
- `GET /api/v1/products/count` - Contabiliza o número de produtos

#### Pedidos
- `GET /api/v1/orders` - Lista todos os pedidos
- `GET /api/v1/orders/:id` - Detalhes de um pedido
- `POST /api/v1/orders` - Criar novo pedido
- `PUT /api/v1/orders/:id` - Atualizar pedido
- `DELETE /api/v1/orders/:id` - Remover pedido
- `GET /api/v1/orders/count` - Contabiliza o número pedidos

## Arquitetura

O projeto segue uma arquitetura em camadas bem definida:
- Controllers: Manipulação de requisições HTTP
- Services: Lógica de negócio
- Models: Regras de domínio
- DTOs: Serialização de dados
