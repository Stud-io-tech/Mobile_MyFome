import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/constants/local_storage_constant.dart';
import 'package:my_fome/src/data/repositories/stores/store_repository_impl.dart';
import 'package:my_fome/src/data/repositories/users/user_repository_impl.dart';
import 'package:my_fome/src/data/services/client/client_service_impl.dart';
import 'package:my_fome/src/data/services/local/local_storage_service.dart';
import 'package:my_fome/src/domain/dtos/stores/store_register_dto.dart';
import 'package:my_fome/src/domain/dtos/stores/store_update_dto.dart';
import 'package:my_fome/src/domain/dtos/users/user_login_dto.dart';
import 'package:my_fome/src/domain/repositories/stores/store_repository.dart';
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
  late StoreRepository storeRepository;
  late UserRepository userRepository;

  setUp(() {
    localStorageService = MockLocalStorageService();
    storeRepository = StoreRepositoryImpl(
        clientService: ClientServiceImpl(localStorageService));
    userRepository = UserRepositoryImpl(
        clientService: ClientServiceImpl(localStorageService));
  });

  group("Testando as operações do StoreRepository, usando a Api real.", () {
    group("Testando o list.", () {
      test("Deve listar as lojas com sucesso.", () async {
        final listStore = await storeRepository.list();
        expect(listStore.isSuccess(), isTrue);
      });

      test("Deve verificar que existe a loja chamada 'Shop'.", () async {
        late bool hasStore = false;

        final listStore = await storeRepository.list();

        listStore.onSuccess((success) => hasStore = success.any(
              (element) => element.name == "Shop",
            ));

        expect(hasStore, isTrue);
      });
    });

    group("Testando o register", () {
      test("Testando o sucesso no registro de loja.", () async {
        final image = XFile("assets/images/logos/my-fome-logo-vertical.svg");
        final storeToRegister = StoreRegisterDto(
          name: "Nova Loja",
          description: "Descrição da loja",
          whatsapp: "+5511999999999",
        );

        final user = UserLoginDto(email: "lazaroalexandre2002@gmail.com");

        final login = await userRepository.login(user);

        await localStorageService.put(
            LocalStorageConstant.accesstoken, login.getOrThrow().token);

        final result = await storeRepository.register(storeToRegister, image);

        expect(result.isSuccess(), isTrue);
        result.onSuccess((store) {
          expect(store.name, equals("Nova Loja"));
        });
      });
    });

    group("Testando o update", () {
      test("Testando o sucesso na atualização de loja.", () async {
        final storeToUpdate = StoreUpdateDto(
          name: "Loja Atualizada",
          description: "Nova descrição",
          whatsapp: "+5511988888888",
        );

        final user = UserLoginDto(email: "lazaroalexandre2002@gmail.com");

        final login = await userRepository.login(user);

        await localStorageService.put(
            LocalStorageConstant.accesstoken, login.getOrThrow().token);

        final result = await storeRepository.update(
          "9e2edfe8-7511-497f-92d5-eb3347986e45",
          storeToUpdate,
        );

        expect(result.isSuccess(), isTrue);
      });
    });
  });
}
