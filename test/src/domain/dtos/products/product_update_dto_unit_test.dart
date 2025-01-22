import 'package:dio/dio.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';
import 'package:my_fome/src/domain/validators/products/product_update_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProductUpadteValidator updateValidator = ProductUpadteValidator();

  group("Testando validações de dados ao registrar produtos.", () {
    final image =
        MultipartFile.fromString("https://homolazaus/files/imagem.png");
    test("Deve validar registro de produto com sucesso.", () {
      final update = ProductUpdateDto(
          id: "id",
          name: "name",
          description: "description",
          image: image,
          price: 12,
          quantity: 21);
      final updateId = ProductUpdateDto(id: "id");
      final updateName = ProductUpdateDto(id: "id", name: "name");
      final updateDescription =
          ProductUpdateDto(id: "id", description: "description");
      final updateImage = ProductUpdateDto(id: "id", image: image);
      final updatePrice = ProductUpdateDto(id: "id", price: 12);
      final updateQuantity = ProductUpdateDto(id: "id", quantity: 12);

      expect(updateValidator.validate(update).isValid, true);
      expect(updateValidator.validate(updateId).isValid, true);
      expect(updateValidator.validate(updateName).isValid, true);
      expect(updateValidator.validate(updateDescription).isValid, true);
      expect(updateValidator.validate(updateImage).isValid, true);
      expect(updateValidator.validate(updatePrice).isValid, true);
      expect(updateValidator.validate(updateQuantity).isValid, true);
    });
  });

  group("Testando conversões de tipos de dados ao atualizar produtos.", () {
    final update = ProductUpdateDto(
      id: "id",
      name: "Cachorro Quente Padrão 300g",
    );
    test("toMap: deve converter um objeto em um mapa tipo dart.", () {
      final productupdateToMapper = {
        "id": "id",
        "name": "Cachorro Quente Padrão 300g",
        "description": null,
        "image": null,
        "price": null,
        "quantity": null
      };

      expect(update.toMap(), equals(productupdateToMapper));
    });

    test("fromMap: deve converter um mapa dart em um objeto.", () {
      final productupdateFromMap = ProductUpdateDto.fromMap({
        "id": "id",
        "name": "Cachorro Quente Padrão 300g",
      });

      expect(productupdateFromMap, equals(update));
    });
  });
}
