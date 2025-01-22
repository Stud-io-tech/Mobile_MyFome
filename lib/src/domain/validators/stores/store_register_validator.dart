import 'package:lucid_validation/lucid_validation.dart';
import 'package:my_fome/src/domain/dtos/stores/store_register_dto.dart';

class StoreRegisterValidator extends LucidValidator<StoreRegisterDto> {
  StoreRegisterValidator() {
    ruleFor((e) => e.name, key: "name").notEmptyOrNull();
    ruleFor((e) => e.description, key: "description").notEmptyOrNull();
    ruleFor((e) => e.image, key: "image").isNotNull();
    ruleFor((e) => e.whatsapp, key: "whatsapp").notEmptyOrNull().maxLength(11).minLength(11);
  }
}
