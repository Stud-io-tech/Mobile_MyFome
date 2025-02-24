import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/constants/local_storage_constant.dart';
import 'package:my_fome/src/data/repositories/products/produtc_repository_impl.dart';
import 'package:my_fome/src/data/repositories/users/user_repository_impl.dart';
import 'package:my_fome/src/data/services/client/client_service_impl.dart';
import 'package:my_fome/src/data/services/local/local_storage_service.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';
import 'package:my_fome/src/domain/dtos/users/user_login_dto.dart';
import 'package:my_fome/src/domain/repositories/products/produtc_repository.dart';
import 'package:my_fome/src/domain/repositories/users/user_repository.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {
  final _store = <String, String>{};
  @override
  Future<void> put(String key, value) async {
    _store[key] = value;
  }

  @override
  Future<String?> get(String key) async {
    return _store[key];
  }
}

void main() {
  late LocalStorageService localStorageService;
  late ProdutcRepository productRepository;
  late UserRepository userRepository;

  setUp(() {
    localStorageService = MockLocalStorageService();
    productRepository = ProdutcRepositoryImpl(
        clientService: ClientServiceImpl(localStorageService));
    userRepository = UserRepositoryImpl(
        clientService: ClientServiceImpl(localStorageService));
  });

  group("Testando as operações do ProductRepository, usando a Api real.", () {
    group("Testando o listActive.", () {
      test("Deve verificar que a lista de produtos não seja vazia.", () async {
        final listProduct = await productRepository.listActive();

        expect(listProduct.isSuccess(), isTrue);
      });

      test("Deve verificar que existe a produto chamada 'CG'.", () async {
        late bool hasStore = false;

        final listStore = await productRepository.listActive();

        listStore.onSuccess((success) => hasStore = success.any(
              (element) => element.name == "CG",
            ));

        expect(hasStore, isTrue);
      });
    });

    group("Testando o listInactive.", () {
      test("Deve verificar que a lista de produtos não seja vazia.", () async {
        final listProduct = await productRepository.listInactiveByStore("id...");
        expect(listProduct.isSuccess(), isFalse);
      });

      test("Deve verificar que existe a produto chamada 'pp'.", () async {
        late bool hasStore = true;

        final listStore = await productRepository.listInactiveByStore("id...");

        listStore.onSuccess((success) => hasStore = success.any(
              (element) => element.name == "pp",
            ));

        expect(hasStore, isTrue);
      });
    });

    group("Testando o listaByStore.", () {
      test("Deve listar de produtos de uma loja.", () async {
        await userRepository.login(UserLoginDto(email: "lazaro@gmail.com"));

        final listProduct = await productRepository
            .listActiveByStore("9e20aade-d0a6-4a15-9996-c2389401520c");

        expect(listProduct.isSuccess(), isTrue);
      });

      test("Deve mostrar um erro ao procurar produtos de uma loja inexistente.",
          () async {
        await userRepository.login(UserLoginDto(email: "lazaro@gmail.com"));

        final listStore = await productRepository.listActiveByStore("9e20aade");

        expect(listStore.isError(), isTrue);
      });
    });

    group("Testando o register", () {
      test("Testando o sucesso no registro de loja.", () async {
        final image = XFile("assets/images/logos/my-fome-logo-vertical.svg");
        final storeToRegister = ProductRegisterDto(
          name: "Novo Produto",
          description: "Descrição do novo produto",
          price: "12.9",
          amount: "1",
          storeId: "9e2edfe8-7511-497f-92d5-eb3347986e45",
        );

        final user = UserLoginDto(email: "lazaroalexandre2002@gmail.com");

        final login = await userRepository.login(user);

        await localStorageService.put(
            LocalStorageConstant.accesstoken, login.getOrThrow().token);

        final result = await productRepository.register(storeToRegister, image);

        expect(result.isSuccess(), isTrue);
      });
    });

    group("Testando o update", () {
      test("Testando o sucesso na atualização de loja.", () async {
        final storeToUpdate = ProductUpdateDto(
          name: "Produto Atualizado",
          description: "Descrição do produto atualizado",
          price: "12.9",
          amount: "4",
          storeId: "9e2edfe8-7511-497f-92d5-eb3347986e45"
        );

        final user = UserLoginDto(email: "lazaroalexandre2002@gmail.com");

        final login = await userRepository.login(user);

        await localStorageService.put(
            LocalStorageConstant.accesstoken, login.getOrThrow().token);

        final result = await productRepository.update(
          "9e2f07da-0a59-4f04-a2ae-7a9869953210",
          storeToUpdate,
        );

        expect(result.isSuccess(), isTrue);
      });
    });

    group("Testando o toggleActive", () {
      test("Deve alternar o status de um produto com sucesso.", () async {

        final user = UserLoginDto(email: "lazaroalexandre2002@gmail.com");

        final login = await userRepository.login(user);

        await localStorageService.put(
            LocalStorageConstant.accesstoken, login.getOrThrow().token);

        final result = await productRepository.toggleActive(
          "9e2f07da-0a59-4f04-a2ae-7a9869953210",
        );

        expect(result.isSuccess(), isTrue);
      });
    });

    
  });
}
