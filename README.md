# Desconto INSS 2024

![Ruby Tests](https://github.com/parkournick3/desconto-inss/actions/workflows/ruby.yml/badge.svg)

## Funcionalidades principais

- CRUD Proponentes.
- Desconto do INSS calculado automaticamente.
- Salário Líquido calculado automaticamente de forma assincrona.
- Relatório do proponentes com gráfico e tabela.

## Live preview

WIP

## Como executar localmente

#### Requisitos

- Ruby version: 3.3
- Redis
- PostgreSQL 14
- Bun

#### Comandos

```bash
# Execute os seguintes os comandos
bun install
bun run build
bundle install

# Para executar o servidor
rails s

# Para executar o sidekiq
bundle exec sidekiq
```

#### Com docker compose

Se prefirir, é possível rodar com docker compose.

```bash
docker compose up
```

## Preview

![image](https://github.com/parkournick3/desconto-inss/assets/131922314/15fdfdce-97bb-4b01-b392-dd1d509d3050)
![image](https://github.com/parkournick3/desconto-inss/assets/131922314/89f89d34-431f-48e0-af20-8dc497051d01)
