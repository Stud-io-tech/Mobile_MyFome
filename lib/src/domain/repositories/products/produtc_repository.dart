import 'package:image_picker/image_picker.dart';
import 'package:my_fome/src/domain/dtos/products/product_detail_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ProdutcRepository {
  AsyncResult<List<ProductDetailDto>> listActive();
  AsyncResult<List<ProductDetailDto>> listInactive();
  AsyncResult<ProductRegisterDto> register(
      ProductRegisterDto product, XFile image);
  AsyncResult<ProductUpdateDto> update(String id, ProductUpdateDto product,
      {XFile? image});
  AsyncResult<ProductDetailDto> toggleActive(String id);
  AsyncResult<List<ProductDetailDto>> listByStore(String id);
}
