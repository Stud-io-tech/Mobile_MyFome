import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/data/repositories/products/produtc_repository_impl.dart';
import 'package:my_fome/src/data/repositories/users/user_repository_impl.dart';
import 'package:my_fome/src/data/services/client/client_service_impl.dart';
import 'package:my_fome/src/data/services/local/local_storage_service.dart';
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
        final listProduct = await productRepository.listInactive();
        expect(listProduct.isSuccess(), isFalse);
      });

      test("Deve verificar que existe a produto chamada 'pp'.", () async {
        late bool hasStore = true;

        final listStore = await productRepository.listInactive();

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
            .listByStore("9e20aade-d0a6-4a15-9996-c2389401520c");

        expect(listProduct.isSuccess(), isTrue);
      });

      test("Deve mostrar um erro ao procurar produtos de uma loja inexistente.",
          () async {
        await userRepository.login(UserLoginDto(email: "lazaro@gmail.com"));

        final listStore = await productRepository.listByStore("9e20aade");

        expect(listStore.isError(), isTrue);
      });
    });
  });
}
