# MyFome

Este projeto tem como objetivo desenvolver a parte visual interativa de um sistema de catalogo de produtos chamado MyFome, a fim de simplificar o gerenciamento de lojas virtuais e inttroduzindo o micro e pequeno empresário no mercado digital. 

Ao decorrer das branches, você poderá observar a presença da arquitetural MVVM até metodologias de design e testes de software, a fim de construir um sistema simples e escalável.

Por fim, caso queira compartilhar sugestões sobre o projeto, entre em contato pelo e-mail: lazaroalexandre.dev@gmail.com ou crie uma nova issue.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- Baixar e instalar dependências:
    - flutter pub get
  
- Crie o build do gerenciamento de estado:
    - dart run build_runner build

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