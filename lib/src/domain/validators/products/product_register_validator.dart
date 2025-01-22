import 'package:lucid_validation/lucid_validation.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';

class ProductRegisterValidator extends LucidValidator<ProductRegisterDto> {
  ProductRegisterValidator() {
    ruleFor((e) => e.name, key: "name").notEmptyOrNull();
    ruleFor((e) => e.description, key: "description").notEmptyOrNull();
    ruleFor((e) => e.image, key: "image").isNotNull();
    ruleFor((e) => e.price, key: "price").isNotNull();
    ruleFor((e) => e.quantity, key: "quantity").isNotNull();
    ruleFor((e) => e.storeId, key: "storeId").notEmptyOrNull();
  }
}
