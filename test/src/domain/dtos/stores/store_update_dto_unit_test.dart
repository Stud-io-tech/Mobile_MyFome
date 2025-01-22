import 'package:dio/dio.dart';
import 'package:my_fome/src/domain/dtos/stores/store_update_dto.dart';
import 'package:my_fome/src/domain/validators/stores/store_update_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  StoreUpadteValidator updateValidator = StoreUpadteValidator();

  group("Testando validações de dados ao registrar lojas.", () {
    final image =
        MultipartFile.fromString("https://homolazaus/files/imagem.png");
    test("Deve validar registro de loja com sucesso.", () {
      final update = StoreUpdateDto(
          id: "id",
          name: "name",
          description: "description",
          image: image,
          whatsapp: "12345678910");
      final updateId = StoreUpdateDto(id: "id");
      final updateName = StoreUpdateDto(id: "id", name: "name");
      final updateWhatsapp = StoreUpdateDto(id: "id", whatsapp: "12345678910");
      final updateDescription =
          StoreUpdateDto(id: "id", description: "description");
      final updateImage = StoreUpdateDto(id: "id", image: image);

      expect(updateValidator.validate(update).isValid, true);
      expect(updateValidator.validate(updateId).isValid, true);
      expect(updateValidator.validate(updateName).isValid, true);
      expect(updateValidator.validate(updateDescription).isValid, true);
      expect(updateValidator.validate(updateWhatsapp).isValid, true);
      expect(updateValidator.validate(updateImage).isValid, true);
    });
    test("Deve falhar ao registrar loja com WhatsApp inválido.", () {
      final update = StoreUpdateDto(
          id: "id",
          name: "name",
          description: "description",
          image: image,
          whatsapp: "123");

      expect(updateValidator.validate(update).isValid, false);
    });
  });

  group("Testando conversões de tipos de dados ao atualizar lojas.", () {
    final update = StoreUpdateDto(
      id: "id",
      name: "Dogão Fast",
    );
    test("toMap: deve converter um objeto em um mapa tipo dart.", () {
      final storeupdateToMapper = {
        "id": "id",
        "name": "Dogão Fast",
        "description": null,
        "image": null,
        "whatsapp": null
      };

      expect(update.toMap(), equals(storeupdateToMapper));
    });

    test("fromMap: deve converter um mapa dart em um objeto.", () {
      final storeupdateFromMap = StoreUpdateDto.fromMap({
        "id": "id",
        "name": "Dogão Fast",
      });

      expect(storeupdateFromMap, equals(update));
    });
  });
}
