# Ruby on Rails (_Api_) for Github

> Api para consumir o endpoint de repositórios do github

Para você conseguir visualizar da melhor maneira, há um arquivo no PostMan:

- `link para importar`: https://www.getpostman.com/collections/5ee5a7a606db387f84fb


## Index

### @request

para esse request você pode utilizar da seguinte maneira

> você pode fazer a requisição normal, que a mesma vai retornar com o limit ou também pode passar parametros

você também pode mesclar os parametros.

### @Params

parametros que são suportados:

- `language`: linguagem de programação

```curl
http://localhost:3001/api/v1/github/repositories?language=Python
```
 
- `order`: para ordernação de estrelas
- `limit`: para ĺimitar a quantidade

```curl
http://localhost:3001/api/v1/github/repositories?order=desc&limit=1
```

## Refresh

```curl
http://localhost:3001/api/v1/github/refresh
```

> request for api	

para dar atualizar o database

## Show

```curl
http://localhost:3001/api/v1/github/repositories/1
``` 

### @request

aqui você pode pesquisar por um reqpositorio em especifico



------------

## Pesquisas 

- A aplicação deve importar e guardar em banco informações sobre repositórios com mais estrelas do GitHub na seguinte API: https://api.github.com/search/repositories;
  - A aplicação deverá possuir um endpoint público que liste os 5 repositórios com mais estrelas do GitHub em ordem decrescente.

```curl
https://api.github.com/search/repositories?q=sort=stars&order=desc
```

- O endpoint pode receber uma linguagem em formato string como parâmetro opcional, os repositórios do retorno devem ser apenas da linguagem informada.

```curl
https://api.github.com/search/repositories?q=language:${params}&sort=stars&order=desc
```

## Informações Adicionais:

- O retorno do endpoint deve trazer, além de informações do repositório, os dados do usuário owner de cada repositório.
- A solução deve ser uma aplicação totalmente nova;
- A solução deve estar em um repositório público do GitHub;
- O deploy deve ser realizado, preferencialmente, no Heroku ou AWS (caso tenha problemas de licença ou semelhantes nessa fase, nos avise);


## Executar o projeto

```sh
# criar o banco de dados
rake db:create

# migrar o banco de dados
rake db:migrate
```
