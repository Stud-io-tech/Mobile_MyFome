import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/constants/local_storage_constant.dart';
import 'package:my_fome/src/data/repositories/users/user_repository_impl.dart';
import 'package:my_fome/src/data/services/client/client_service_impl.dart';
import 'package:my_fome/src/data/services/local/local_storage_service.dart';
import 'package:my_fome/src/domain/dtos/users/user_login_dto.dart';
import 'package:my_fome/src/domain/dtos/users/user_register_dto.dart';
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
  late UserRepository userRepository;
  setUp(() {
    localStorageService = MockLocalStorageService();
    userRepository = UserRepositoryImpl(
        clientService: ClientServiceImpl(localStorageService));
  });

  group("Testando as operações do UserRepository, usando a Api real.", () {
    group("Testando o login.", () {
      test(
        "Deve verificar se é possível fazer login com uma conta existente.",
        () async {
          final user = UserLoginDto(email: "lazaro@gmail.com");
          final result = await userRepository.login(user);
          expect(result.isSuccess(), isTrue);
          await localStorageService.put(
              LocalStorageConstant.accesstoken, result.getOrThrow().token);
        },
      );

      test(
        "Deve falhar ao tentar fazer login com uma conta inexistente.",
        () async {
          final user = UserLoginDto(email: "welen@gmail.com");
          final result = await userRepository.login(user);
          expect(result.isError(), isTrue);
        },
      );
    });

    group("Testando o Register.", () {
      test("Deve verificar se é possível registro de uma conta inexistente.",
          () async {
        final user = UserRegisterDto(
            name: "martins", email: "martins@gmail.com");
        final result = await userRepository.register(user);
        expect(result.isSuccess(), isTrue);
      });

      test("Deve falhar ao tentar registrar com uma conta existente.",
          () async {
        final user = UserRegisterDto(
            name: "lazaro", email: "lazaro@gmail.com", image: null);
        final result = await userRepository.register(user);
        expect(result.isError(), isTrue);
      });
    });

    group("Testando o Detail de Usuário.", () {
      test("Deve verificar se é possível mostrar os dados de usuário.",
          () async {
        final resultLogin =
            await userRepository.login(UserLoginDto(email: "lazaro@gmail.com"));

        final token = resultLogin.getOrThrow().token;

        await localStorageService.put(LocalStorageConstant.accesstoken, token);

        final result = await userRepository.detail();

        expect(result.isSuccess(), isTrue);
      });
    });
  });
}
