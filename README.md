# Desconto INSS 2024

![Ruby Tests](https://github.com/parkournick3/desconto-inss/actions/workflows/ruby.yml/badge.svg)

![image](https://github.com/parkournick3/desconto-inss/assets/131922314/4898f49a-f121-4716-bb9c-1455a5f6d2de)

1. [Principais funcionalidades](https://github.com/parkournick3/desconto-inss?tab=readme-ov-file#point_down-funcionalidades-principais-point_down)
2. [Live Preview](https://github.com/parkournick3/desconto-inss?tab=readme-ov-file#point_down-live-preview-point_down)
3. [Como rodar localmente ( com e sem docker )](https://github.com/parkournick3/desconto-inss?tab=readme-ov-file#octocat-como-executar-localmente-octocat)
4. [Deployment](https://github.com/parkournick3/desconto-inss?tab=readme-ov-file#cloud-deployment-cloud)
5. [Preview](https://github.com/parkournick3/desconto-inss?tab=readme-ov-file#camera-preview-camera)
6. ![Fonte do cálculo](https://www.gov.br/inss/pt-br/assuntos/confira-as-aliquotas-de-contribuicao-ao-inss-com-o-aumento-do-salario-minimo)

## :point_down: Funcionalidades principais :point_down:

:white_check_mark: CRUD Proponentes.

:white_check_mark: Desconto do INSS calculado automaticamente.

:white_check_mark: Salário Líquido calculado automaticamente de forma assincrona com Sidekiq e Redis.

:white_check_mark: Relatório de proponentes com gráfico e tabela.

:white_check_mark: Sistema de autenticação com Devise

:black_square_button: Design responsivo ( Work in Progress )

## :point_down: Live preview :point_down:

https://desconto-inss.onrender.com
⚠️ ( a instancia que estou usando é free e quando você tentar acessar pode demorar cerca de 100 segundos pra ficar online )

Entre com a conta email:_admin@admin_, senha:_admin123_ ou crie uma nova conta!

## :octocat: Como executar localmente :octocat:

#### Sem docker compose

**Requisitos**

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
./bin/dev

# 4 - Em outro terminal execute o sidekiq
bundle exec sidekiq
```

#### Com docker compose

**Requisitos**

- Docker
- Docker Compose

#### Comandos

```bash
# 1 - Execute o postgres, api, redis e sidekiq
docker compose up
```

## :cloud: Deployment :cloud:

Dê um fork nesse repositorio e clique no botão abaixo para fazer o deploy no [Render](https://render.com/)

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

Veja este guia https://docs.render.com/deploy-rails e este https://render.com/docs/deploy-sidekiq-worker pra mais informações.

## :camera: Preview :camera:

![image](https://github.com/parkournick3/desconto-inss/assets/131922314/15fdfdce-97bb-4b01-b392-dd1d509d3050)
![image](https://github.com/parkournick3/desconto-inss/assets/131922314/89f89d34-431f-48e0-af20-8dc497051d01)
