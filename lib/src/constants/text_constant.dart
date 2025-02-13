final class TextConstant {
  static String welcome = 'Bem-vindo ao My Fome.';
  static String home = 'Home';
  static String products = 'Produtos';
  static String stores = 'Lojas';
  static String myStore = 'Minha Loja';
  static String logout = 'Sair';
  static String seeMore = 'ver mais';
  static String sucessLoggingAccountTitle = 'Bem-vindo ao MyFome!';
  static String sucessLoggingOutAccountTitle = 'Conta Desvinculada!';
  static String sucessCreatingAccountTitle = 'Conta Criada!';
  static String sucessCreatingStoreTitle = 'Loja Criada!';
  static String sucessCreatingProductTitle = 'Produto Criado!';
  static String sucessUpdatingStoreTitle = 'Loja Atualizada!';
  static String sucessUpdatingProductTitle = 'Produto Atualizada!';

  static String sucessSuspendingProductTitle = 'Produto Suspenso!';
  static String sucessRestoreProductTitle = 'Produto Restaurado!';

  static String logoutAccountTitle = 'Sair da Conta?';
  static String suspendProductTitle = 'Suspender o Produto?';
  static String sucessLoggingAccountMessage = 'Que tal fazer um pedido?';
  static String sucessLoggingOutAccountMessage =
      'Você saiu da conta. Volte sempre!';
  static String sucessCreatingAccountMessage =
      'Sua conta foi criada com sucesso.';
  static String sucessCreatingStoreMessage = 'A loja foi criada com sucesso.';
  static String sucessCreatingProductMessage = 'A loja foi criado com sucesso.';

  static String sucessUpdatingStoreMessage =
      'A loja foi atualizada com sucesso.';
  static String sucessUpdatingProductMessage =
      'O produto foi atualizado com sucesso.';
  static String sucessSuspendingProductMessage =
      'O produto foi suspenso com sucesso.';
  static String sucessRestoreProductMessage =
      'O produto foi restaurado com sucesso.';

  static String errorTitle = 'Erro!';
  static String errorLoggingAccountMessage = 'Houve um erro ao fazer login.';
  static String errorCreatingAccountMessage =
      'Houve um erro ao criar sua conta.';
  static String errorListStoresMessage = 'Houve um erro ao listar as lojas.';
  static String errorListProductsMessage =
      'Houve um erro ao listar os produtos.';
  static String errorCreatingStoreMessage = 'Houve um erro ao criar a loja.';
  static String errorCreatingProductMessage =
      'Houve um erro ao criar o produto.';
  static String errorUpdatingStoreMessage =
      'Houve um erro ao atualizar a loja.';
  static String errorUpdatingProductMessage =
      'Houve um erro ao atualizar o produto.';

  static String errorDetailsUserMessage =
      'Houve um erro ao encontrar o usuário.';

  static String errorDetailsStoreMessage = 'Houve um erro ao encontrar a loja.';
  static String errorExecutingProductMessage =
      'Houve um erro de execeução! Tente novamente.';

  static String yes = 'Sim';
  static String no = 'Não';
  static String storeProducts = 'Produtos da Loja';
  static String newProduct = 'Novo Produto';
  static String newStore = 'Nova Loja';
   static String updateProduct = 'Editar Produto';
  static String updateStore = 'Editar Loja';

  static String editProduct = 'Editar Produto';

  static String helloUser(String? userName) =>
      userName != null ? 'Olá, $userName!' : 'Olá!';
  static String quantityAvailable(int quantity) => '$quantity restantes';
  static String monetaryValue(double value) =>
      'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
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
  static String amount = 'Quantidade';
  static String price = 'Preço';
  static String whatsapp = 'Whatsapp';
  static String costPerShipping = 'Custo por Frete';
  static String image = 'Imagem';
  static String uploadImage = 'Upload da Imagem';
  static String placeOrder = 'Fazer Pedido';
  static String addQuantity = 'Adicionar quantidade';

  static String requiredLogin = 'Você precisa fazer login!';
  static String loggin = 'Fazer Login';

  static String total = 'Total:';

  static String storeName = 'Nome da loja';
  static String storeDescription = 'Descrição da loja';
  static String storeWhatsappNumber = 'Whatsapp da loja';

  static String productName = 'Nome do produto';
  static String productDescription = 'Descrição do produto';
  static String productPrice = 'Preço do produto';
  static String productAmount = 'Quantidade do produto';
}
