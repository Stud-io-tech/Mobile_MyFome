import 'package:flutter_test/flutter_test.dart';
import 'package:my_fome/src/domain/dtos/users/user_register_dto.dart';
import 'package:my_fome/src/domain/validators/users/user_register_validator.dart';

void main() {
  UserRegisterValidator registerValidator = UserRegisterValidator();

  group("Testando validações de dados ao registrar usuários.", () {
    test("Deve validar registro de usuário com sucesso.", () {
      final registerOne =
          UserRegisterDto(name: "Lázaro", email: "lazaroalexandre@gmail.com",image: "https://homolazaus/files/imagem.png");

      final registerTwo =
          UserRegisterDto(name: "Lázaro", email: "lazaroalexandre@gmail.com");    
      final validationResultOne = registerValidator.validate(registerOne);

      final validationResultTwo = registerValidator.validate(registerTwo);

      expect(validationResultOne.isValid, true);
      expect(validationResultTwo.isValid, true);
    });

    test("Deve validar registro de usuário com erro.", () {
      final registerTestOne =
          UserRegisterDto(email: "lazaroalexnadre@", name: "Lázaro");
      final registerTestTwo =
          UserRegisterDto(email: "lazaroalexnadre@gmail.com", name: "");
      final registerTestThree =
          UserRegisterDto(email: "lazaroalexnadre@", name: "");
      final registerTestFour =
          UserRegisterDto(email: "lazaroalexnadre.com", name: "Lázaro");
      final registerTestFive =
          UserRegisterDto(email: "lazaroalexnadre.com", name: "");
      final registerTestSix = UserRegisterDto(email: "", name: "");

      final validationResultTestOne = registerValidator.validate(registerTestOne);
      final validationResultTestTwo = registerValidator.validate(registerTestTwo);
      final validationResultTestThree =
          registerValidator.validate(registerTestThree);
      final validationResultTestFour =
          registerValidator.validate(registerTestFour);
      final validationResultTestFive =
          registerValidator.validate(registerTestFive);
      final validationResultTestSix = registerValidator.validate(registerTestSix);

      expect(validationResultTestOne.isValid, false);
      expect(validationResultTestTwo.isValid, false);
      expect(validationResultTestThree.isValid, false);
      expect(validationResultTestFour.isValid, false);
      expect(validationResultTestFive.isValid, false);
      expect(validationResultTestSix.isValid, false);
      
    });
  });

  group("Testando conversões de tipos de dados ao registrar usuários.", () {
    final userRegister = UserRegisterDto(email: "lazaroalexandre@gmail.com", name: "Lázaro", image: "https://homolazaus/files/imagem.png");
    test("toMap: deve converter um objeto em um mapa tipo dart.", () {
      final userRegisterToMapper = {"email": "lazaroalexandre@gmail.com", "name": "Lázaro", "image": "https://homolazaus/files/imagem.png"};

      expect(userRegister.toMap(), equals(userRegisterToMapper));
    });

    test("toJson: deve converter um objeto em um mapa tipo json.", () {
      const userLoginToJson = '{"name":"Lázaro","email":"lazaroalexandre@gmail.com","image":"https://homolazaus/files/imagem.png"}';

      expect(userRegister.toJson(), equals(userLoginToJson));
    });

    test("fromMap: deve converter um mapa dart em um objeto.", () {
      final userRegisterFromMap =
          UserRegisterDto.fromMap({"email": "lazaroalexandre@gmail.com", "name": "Lázaro", "image": "https://homolazaus/files/imagem.png"});

      expect(userRegisterFromMap, equals(userRegister));
    });

    test("fromJson: deve converter um mapa json em um objeto.", () {
      final userRegisterFromJson =
          UserRegisterDto.fromJson('{"email":"lazaroalexandre@gmail.com","name":"Lázaro","image":"https://homolazaus/files/imagem.png"}');

      expect(userRegisterFromJson, equals(userRegister));
    });
  });
}
