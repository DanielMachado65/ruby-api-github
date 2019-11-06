# Pesquisas 

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