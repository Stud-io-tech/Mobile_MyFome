import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/domain/dtos/users/user_login_dto.dart';
import 'package:my_fome/src/domain/dtos/users/user_register_dto.dart';
import 'package:my_fome/src/data/repositories/users/user_repository_impl.dart';
import 'package:my_fome/src/data/services/client/client_service.dart';
import 'package:my_fome/src/domain/repositories/users/user_repository.dart';

class ClientMock extends Mock implements ClientService {}

void main() {
  late ClientMock clientMock;
  late UserRepository userRepositoryMock;

  setUp(() {
    clientMock = ClientMock();
    userRepositoryMock = UserRepositoryImpl(clientService: clientMock);
  });

  group("Testando as operações do UserRepository, usando mocks.", () {
    final dataBaseTest = {
      "user": [
        {
          "id": "1",
          "name": "Lázaro",
          "email": "lazaroalexandre@gmail.com",
          "image": "image.png",
        },
      ],
    };
    group("Testando o login.", () {
      test(
        "Deve verificar se é possível fazer login com uma conta existente.",
        () async {
          late String? token;
          final loginTest = UserLoginDto(email: "lazaroalexandre@gmail.com");

          final userExist = dataBaseTest["user"]!.any(
            (element) => element["email"] == "lazaroalexandre@gmail.com",
          );

          if (userExist) {
            token = "sldiuaosdiou87123981273e9woew";
          } else {
            token = null;
          }

          final response = Response(
              requestOptions: RequestOptions(), data: {"token": token});

          when(
            () => clientMock.post(any(), any()),
          ).thenAnswer((_) async => response);

          final result = await userRepositoryMock.login(loginTest);

          expect(result.isSuccess(), isTrue);
          expect(token, isNotNull);

          verify(() => clientMock.post(any(), any())).called(1);
        },
      );

      test(
        "Deve falhar ao tentar fazer login com uma conta inexistente.",
        () async {
          late String? token;

          final loginTest = UserLoginDto(email: "luis@gmail.com");

          final userExist = dataBaseTest["user"]!.any(
            (element) => element["email"] == "luis@gmail.com",
          );

          if (userExist) {
            token = "sldiuaosdiou87123981273e9woew";
          } else {
            token = null;
          }

          final response = DioException(
            requestOptions: RequestOptions(),
          );

          when(
            () => clientMock.post(any(), any()),
          ).thenThrow(response);

          final result = await userRepositoryMock.login(loginTest);

          expect(result.isError(), isTrue);
          expect(token, isNull);

          verify(() => clientMock.post(any(), any())).called(1);
        },
      );
    });

    group("Testando o Register.", () {
      test(
        "Deve verificar se é possível registro de uma conta inexistente.",
        () async {
          final registerTest = UserRegisterDto(
              name: "Luis", email: "luismartins@gmail.com", image: "image.png");

          final response = Response(
            requestOptions: RequestOptions(),
            data: registerTest.toMap(),
          );

          when(
            () => clientMock.post(any(), any()),
          ).thenAnswer((_) async => response);

          final result = await userRepositoryMock.register(registerTest);

          final userExist = dataBaseTest["user"]!.any(
            (element) => element["email"] == registerTest.email,
          );

          expect(result.isSuccess(), isTrue);
          expect(userExist, isFalse);

          verify(() => clientMock.post(any(), any())).called(1);
        },
      );

      test(
        "Deve falhar ao tentar registrar com uma conta existente.",
        () async {
          final registerTest = UserRegisterDto(
              name: "Luis",
              email: "lazaroalexandre@gmail.com",
              image: "image.png");

          final response = DioException(
            requestOptions: RequestOptions(),
          );

          when(
            () => clientMock.post(any(), any()),
          ).thenThrow(response);

          final result = await userRepositoryMock.register(registerTest);

          final userExist = dataBaseTest["user"]!.any(
            (element) => element["email"] == registerTest.email,
          );

          expect(result.isError(), isTrue);
          expect(userExist, isTrue);

          verify(() => clientMock.post(any(), any())).called(1);
        },
      );
    });
  });
}
