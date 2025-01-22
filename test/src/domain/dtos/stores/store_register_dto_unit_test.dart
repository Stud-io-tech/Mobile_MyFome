import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_fome/src/domain/dtos/stores/store_register_dto.dart';
import 'package:my_fome/src/domain/validators/stores/store_register_validator.dart';

void main() {
  StoreRegisterValidator registerValidator = StoreRegisterValidator();

  group("Testando validações de dados ao registrar lojas.", () {
    final image =
        MultipartFile.fromString("https://homolazaus/files/imagem.png");

    test("Deve validar registro de loja com sucesso.", () {
      final register = StoreRegisterDto(
          name: "Dogão Express",
          description:
              "Preparamaos os melhores Hot Dogs da região",
          image: image,
          whatsapp: "84992017118");

      final validationResultOne = registerValidator.validate(register);

      expect(validationResultOne.isValid, true);
    });

    test("Deve falhar ao validar registro de loja com nome vazio.", () {
      final register = StoreRegisterDto(
          name: "",
          description: "Descrição válida",
          image: image,
          whatsapp: "84992017118");

      final validationResult = registerValidator.validate(register);

      expect(validationResult.isValid, false);
    });

    test("Deve falhar ao validar registro de loja com descrição vazia.", () {
      final register = StoreRegisterDto(
          name: "Nome válido",
          description: "",
          image: image,
          whatsapp: "84992017118");

      final validationResult = registerValidator.validate(register);

      expect(validationResult.isValid, false);
    });

    test("Deve falhar ao validar registro de loja com WhatsApp inválido.", () {
      final register = StoreRegisterDto(
          name: "Nome válido",
          description: "Descrição válida",
          image: image,
          whatsapp: "123");

      final validationResult = registerValidator.validate(register);

      expect(validationResult.isValid, false);
    });

    test(
        "Deve falhar ao validar registro de loja com quase todos os campos vazios.",
        () {
      final register = StoreRegisterDto(
          name: "", description: "", image: image, whatsapp: "");

      final validationResult = registerValidator.validate(register);

      expect(validationResult.isValid, false);
    });
  });

  group("Testando conversões de tipos de dados ao registrar lojas.", () {
    final image =
        MultipartFile.fromString("https://homolazaus/files/imagem.png");

    final register = StoreRegisterDto(
        name: "Dogão Express",
        description:
            "Preparamaos os melhores Hot Dogs da região",
        image: image,
        whatsapp: "84992017118");
    test("toMap: deve converter um objeto em um mapa tipo dart.", () {
      final storeRegisterToMapper = {
        "name": "Dogão Express",
        "description":
            "Preparamaos os melhores Hot Dogs da região",
        "image": image,
        "whatsapp": "84992017118"
      };

      expect(register.toMap(), equals(storeRegisterToMapper));
    });

    test("fromMap: deve converter um mapa dart em um objeto.", () {
      final storeRegisterFromMap = StoreRegisterDto.fromMap({
        "name": "Dogão Express",
        "description":
            "Preparamaos os melhores Hot Dogs da região",
        "image": image,
        "whatsapp": "84992017118"
      });

      expect(storeRegisterFromMap, equals(register));
    });
  });
}
