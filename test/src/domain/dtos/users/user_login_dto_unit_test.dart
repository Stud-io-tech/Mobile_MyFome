import 'package:flutter_test/flutter_test.dart';
import 'package:my_fome/src/domain/dtos/users/user_login_dto.dart';
import 'package:my_fome/src/domain/validators/users/user_login_validator.dart';

void main() {
  UserLoginValidator loginValidator = UserLoginValidator();

  group("Testando validações de dados ao fazer login.", () {
    test("Deve validar login com sucesso.", () {
      final login = UserLoginDto(email: "lazaroalexnadre@gmail.com");
      final validationResult = loginValidator.validate(login);

      expect(validationResult.isValid, true);
    });

    test("Deve validar login com erro.", () {
      final firstLogin = UserLoginDto(email: "lazaroalexnadre@");
      final secoundLogin = UserLoginDto(email: "lazaroalexnadre.com");
      final thirdLogin = UserLoginDto(email: "");

      final validationResultIncompletEmail =
          loginValidator.validate(firstLogin);
      final validationResultnoAtEmail = loginValidator.validate(secoundLogin);
      final validationResultEmailEmpty = loginValidator.validate(thirdLogin);

      expect(validationResultIncompletEmail.isValid, false);
      expect(validationResultnoAtEmail.isValid, false);
      expect(validationResultEmailEmpty.isValid, false);
    });
  });

  group("Testando conversões de tipos de dados de login.", () {
    final userLogin = UserLoginDto(email: "lazaroalexandre@gmail.com");
    test("toMap: deve converter um objeto em um mapa tipo dart.", () {
      final userLoginToMapper = {"email": "lazaroalexandre@gmail.com"};

      expect(userLogin.toMap(), equals(userLoginToMapper));
    });

    test("toJson: deve converter um objeto em um mapa tipo json.", () {
      const userLoginToJson = '{"email":"lazaroalexandre@gmail.com"}';

      expect(userLogin.toJson(), equals(userLoginToJson));
    });

    test("fromMap: deve converter um mapa dart em um objeto.", () {
      final userLoginFromMap =
          UserLoginDto.fromMap({"email": "lazaroalexandre@gmail.com"});

      expect(userLoginFromMap, equals(userLogin));
    });

    test("fromJson: deve converter um mapa json em um objeto.", () {
      final userLoginFromJson =
          UserLoginDto.fromJson('{"email":"lazaroalexandre@gmail.com"}');

      expect(userLoginFromJson, equals(userLogin));
    });
  });
}
