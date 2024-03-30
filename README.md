# Desconto INSS 2024

## Funcionalidades principais

- CRUD Proponentes.
- Desconto do INSS calculado automaticamente.
- Salário Líquido calculado automaticamente de forma assincrona.
- Relatório do proponentes com gráfico e tabela.

## Requisitos

- Ruby version: 3.3
- Redis
- PostgreSQL 14
- Bun

## Como rodar

```bash
# antes de rodar
bun install
bun run build
bundle install

# para rodar o servidor
rails s

# para rodar o sidekiq
bundle exec sidekiq
```
