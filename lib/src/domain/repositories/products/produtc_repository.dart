import 'package:my_fome/src/domain/dtos/products/product_detail_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ProdutcRepository {
  AsyncResult<List<ProductDetailDto>> listActive();
  AsyncResult<List<ProductDetailDto>> listInactive();
  AsyncResult<ProductRegisterDto> register(ProductRegisterDto product);
  AsyncResult<ProductUpdateDto> update(String id, ProductUpdateDto product);
  AsyncResult<ProductDetailDto> changeActiveStatus(String id);
}
