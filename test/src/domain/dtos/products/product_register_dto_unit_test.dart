import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';
import 'package:my_fome/src/domain/validators/products/product_register_validator.dart';

void main() {
  ProductRegisterValidator registerValidator = ProductRegisterValidator();

  group("Testando validações de dados ao registrar produtos.", () {
    final image =
        MultipartFile.fromString("https://homolazaus/files/imagem.png");

    test("Deve validar registro de produto com sucesso.", () {
      final register = ProductRegisterDto(
          name: "Cachorro Quente Padrão 200g",
          description:
              "Cachorro Quente Padrão 300g com 1 salsicha, 1 pão, 1 porção de carne moída, milho, ervilha, vinagrete, batata-palha e purê de batata.",
          image: image,
          price: 12.50,
          quantity: 12,
          storeId: "storeId");

      final validationResultOne = registerValidator.validate(register);

      expect(validationResultOne.isValid, true);
    });

    test("Deve falhar ao validar registro de produto com nome vazio.", () {
      final register = ProductRegisterDto(
          name: "",
          description: "Descrição válida",
          image: image,
          price: 12.50,
          quantity: 12,
          storeId: "storeId");

      final validationResult = registerValidator.validate(register);

      expect(validationResult.isValid, false);
    });

    test("Deve falhar ao validar registro de produto com descrição vazia.", () {
      final register = ProductRegisterDto(
          name: "Nome válido",
          description: "",
          image: image,
          price: 12.50,
          quantity: 12,
          storeId: "storeId");

      final validationResult = registerValidator.validate(register);

      expect(validationResult.isValid, false);
    });

    test("Deve falhar ao validar registro de produto com id de loja vazio.",
        () {
      final register = ProductRegisterDto(
          name: "Nome válido",
          description: "Descrição válida",
          image: image,
          price: 0,
          quantity: 12,
          storeId: "");

      final validationResult = registerValidator.validate(register);

      expect(validationResult.isValid, false);
    });
  });

  group("Testando conversões de tipos de dados ao registrar produtos.", () {
    final image =
        MultipartFile.fromString("https://homolazaus/files/imagem.png");

    final register = ProductRegisterDto(
        name: "Cachorro Quente Padrão 200g",
        description:
            "Cachorro Quente Padrão 300g com 1 salsicha, 1 pão, 1 porção de carne moída, milho, ervilha, vinagrete, batata-palha e purê de batata.",
        image: image,
        price: 12.50,
        quantity: 12,
        storeId: "storeId");

    test("toMap: deve converter um objeto em um mapa tipo dart.", () {
      final productRegisterToMapper = {
        "name": "Cachorro Quente Padrão 200g",
        "description":
            "Cachorro Quente Padrão 300g com 1 salsicha, 1 pão, 1 porção de carne moída, milho, ervilha, vinagrete, batata-palha e purê de batata.",
        "image": image,
        "price": 12.50,
        "quantity": 12,
        "store_id": "storeId"
      };

      expect(register.toMap(), equals(productRegisterToMapper));
    });

    test("fromMap: deve converter um mapa dart em um objeto.", () {
      final productRegisterFromMap = ProductRegisterDto.fromMap({
        "name": "Cachorro Quente Padrão 200g",
        "description":
            "Cachorro Quente Padrão 300g com 1 salsicha, 1 pão, 1 porção de carne moída, milho, ervilha, vinagrete, batata-palha e purê de batata.",
        "image": image,
        "price": 12.50,
        "quantity": 12,
        "store_id": "storeId"
      });

      expect(productRegisterFromMap, equals(register));
    });
  });
}
