import 'package:lucid_validation/lucid_validation.dart';
import 'package:my_fome/src/domain/dtos/stores/store_update_dto.dart';

class StoreUpadteValidator extends LucidValidator<StoreUpdateDto> {
  StoreUpadteValidator() {
    ruleFor((e) => e.id, key: "id").notEmptyOrNull();
    ruleFor((e) => e.whatsapp, key: "whatsapp")
        .maxLengthOrNull(11)
        .minLengthOrNull(11);
    ruleFor((e) => e.name, key: "name")
        .when((entity) => entity.name != null)
        .notEmptyOrNull();
    ruleFor((e) => e.description, key: "description")
        .when((entity) => entity.description != null)
        .notEmptyOrNull();
    ruleFor((e) => e.image, key: "image")
        .when((entity) => entity.image != null)
        .isNotNull();
  }
}
