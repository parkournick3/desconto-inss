# Desconto INSS 2024

![Ruby Tests](https://github.com/parkournick3/desconto-inss/actions/workflows/ruby.yml/badge.svg)

![image](https://github.com/parkournick3/desconto-inss/assets/131922314/4898f49a-f121-4716-bb9c-1455a5f6d2de)

![Fonte do cálculo](https://www.gov.br/inss/pt-br/assuntos/confira-as-aliquotas-de-contribuicao-ao-inss-com-o-aumento-do-salario-minimo)

## Funcionalidades principais

- CRUD Proponentes.
- Desconto do INSS calculado automaticamente.
- Salário Líquido calculado automaticamente de forma assincrona.
- Relatório do proponentes com gráfico e tabela.

## Live preview

WIP

## Como executar localmente

### Sem docker compose

#### Requisitos

- Ruby version: 3.3
- Redis
- PostgreSQL 14
- Bun

#### Comandos

```bash
# 1 - Execute os seguintes os comandos
bun install
bun run build
bundle install

# 2 - Preparar o banco de dados
rails db:prepare

# 3 - Para executar o servidor
rails s

# 4 - Em outro terminal execute o sidekiq
bundle exec sidekiq
```

### Com docker compose

#### Requisitos

- Docker
- Docker Compose

#### Comandos

```bash
# 1 - Execute o postgres, api, redis e sidekiq
docker compose up
```

## Deploy

WIP

## Preview

![image](https://github.com/parkournick3/desconto-inss/assets/131922314/15fdfdce-97bb-4b01-b392-dd1d509d3050)
![image](https://github.com/parkournick3/desconto-inss/assets/131922314/89f89d34-431f-48e0-af20-8dc497051d01)
