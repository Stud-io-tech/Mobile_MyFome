import 'package:my_fome/src/core/dtos/product/product_detail_dto.dart';
import 'package:my_fome/src/core/dtos/product/product_page_dto.dart';

abstract interface class ProductRepository {
  Future<ProductPageDto> findAllPageByProductCategory(String productCategoryId);
  Future<ProductDetailDto> detail(String id);
}
