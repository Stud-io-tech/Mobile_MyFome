final class TextConstant {
  static String welcome = 'Bem-vindo ao MyFome.';
  static String home = 'Home';
  static String products = 'Produtos';
  static String stores = 'Lojas';
  static String myStore = 'Minha Loja';
  static String logout = 'Sair';
  static String seeMore = 'ver mais';
  static String errorTitle = 'Erro!';
  static String sucessLoggingAccountTitle = 'Bem-vindo ao MyFome!';
  static String sucessLoggingOutAccountTitle = 'Conta Desvinculada!';
  static String sucessCreatingAccountTitle = 'Conta Criada!';
  static String sucessCreatingStoreTitle = 'Loja Criada!';
  static String sucessCreatingProductTitle = 'Produto Criado!';
  static String logoutAccountTitle = 'Sair da Conta?';
  static String suspendProductTitle = 'Suspender o Produto?';
  static String sucessLoggingAccountMessage = 'Que tal fazer um pedido?';
  static String sucessLoggingOutAccountMessage =
      'Você saiu da conta. Volte sempre!';
  static String sucessCreatingAccountMessage =
      'Sua conta foi criada com sucesso.';
  static String errorCreatingAccountMessage =
      'Houve um erro ao criar sua conta.';
  static String sucessCreatingStoreMessage = 'A loja foi criada com sucesso.';
  static String errorCreatingStoreMessage = 'Houve um erro ao criar a loja.';
  static String sucessCreatingProductMessage = 'A loja foi criado com sucesso.';
  static String errorCreatingProductMessage =
      'Houve um erro ao criar o produto.';
  static String sucessUpdatingStoreMessage =
      'A loja foi atualizada com sucesso.';
  static String errorUpdatingStoreMessage =
      'Houve um erro ao atualizar a loja.';
  static String sucessUpdatingProductMessage =
      'A loja foi atualizado com sucesso.';
  static String errorUpdatingProductMessage =
      'Houve um erro ao atualizar o produto.';
  static String sucessSuspendingProductMessage =
      'A loja foi suspenso com sucesso.';
  static String errorSuspendingProductMessage =
      'Houve um erro ao suspender o produto.';
  static String yes = 'Sim';
  static String no = 'Não';
  static String storeProducts = 'Produtos da Loja';
  static String newProduct = 'Novo Produto';
  static String editProduct = 'Editar Produto';
  static String helloUser(String userName) => 'Olá, $userName!';
  static String quantityAvailable(int quantity) => '$quantity restantes';
  static String monetaryValue(double value) =>
      'R\$${value.toStringAsFixed(2).replaceAll('.', ',')}';
  static String logoutAccountMessage(String userEmail) =>
      'Ao confirmar, a conta com o email "$userEmail" será desvinculada do sistema até que seja realizado um novo login.';
  static String suspendProductMessage(String productName) =>
      'Ao confirmar a suspensão do produto "$productName", os usuários não poderão mais ver o produto no sistema até que seja reativado novamente.';
  static String found(int value) => "$value Encontrados";
  static String cityState(String city, String state) => "$city - $state";
  static String storeWhatsapp(String store) =>
      'Olá, $store! Eu gostaria de tirar algumas dúvidas. Você poderia me ajudar?';
  static String suspended = "Suspensos";
    static String actives = "Ativos";
  static const String search = 'Pesquisar...';
  static String save = 'Salvar';
  static String fieldError = "Campo obrigarório!";
  static String minCaractersPhone = 'O mínimo de caracters é 11!';
  static String maxCaractersPhone = 'O máximo de caracters é 11!';
  static String productNotFound = 'Produto não encontrado!';
  static String storeNotFound = 'Loja não encontrada!';
    static String name = 'Nome';
  static String description = 'Descrição';
  static String quantity = 'Quantidade';
  static String price = 'Preço';
  static String whatsapp = 'Whatsapp';
  static String costPerShipping = 'Custo por Frete';
  static String image = 'Imagem';
  static String uploadImage = 'Upload da Imagem';
}