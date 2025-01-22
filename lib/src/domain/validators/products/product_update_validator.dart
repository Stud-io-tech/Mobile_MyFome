import 'package:lucid_validation/lucid_validation.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';

class ProductUpadteValidator extends LucidValidator<ProductUpdateDto> {
  ProductUpadteValidator() {
    ruleFor((e) => e.id, key: "id").notEmptyOrNull();
        ruleFor((e) => e.name, key: "name")
        .when((entity) => entity.name != null)
        .notEmptyOrNull();
    ruleFor((e) => e.description, key: "description")
        .when((entity) => entity.description != null)
        .notEmptyOrNull();
    ruleFor((e) => e.image, key: "image")
        .when((entity) => entity.image != null)
        .isNotNull();
    ruleFor((e) => e.price, key: "image")
        .when((entity) => entity.price != null)
        .isNotNull();
    ruleFor((e) => e.quantity, key: "image")
        .when((entity) => entity.quantity != null)
        .isNotNull();
  }
}
