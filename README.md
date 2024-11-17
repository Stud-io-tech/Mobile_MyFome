# MyFome

Este projeto tem como objetivo desenvolver a parte visual interativa de um sistema de catalogo de produtos chamado MyFome, a fim de simplificar o gerenciamento de lojas virtuais e inttroduzindo o micro e pequeno empresário no mercado digital. 

Neste projeto, você poderá explorar conceitos que vão desde a construção arquitetural MVVM, incluindo views, models, controllers e viewmodels, até design patterns como repositories e services, além de metodologias de design como o Atomic Design.

Por fim, caso queira compartilhar sugestões sobre o projeto, entre em contato pelo e-mail: lazaroalexandre.dev@gmail.com ou crie uma nova issue.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- Baixar e instalar dependências:
    - flutter pub get

- Esolher o dispositivo:
    - flutter devices

- Rodar o aplicativo:
  - flutter run -d _nome_do_dispositivo_

## Observações

Caso esteja rodando o flutter pela primeira vez e não tenha conseguido instalar o aplicativo, faça as seguintes etapas:

- Vá até o arquivo chamado gradle.proerties:
  - android/gradle.properties

- Mude o caminho do distributionUrl para:
  - distributionUrl=https\://services.gradle.org/distributions/gradle-8.3-all.zip

- Se o problema persistir, crie um novo projeto flutter com a plataforma android, copie o caminho do distributionUrl e cole neste projeto flutter.