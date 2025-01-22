// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:my_fome/src/constants/api_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/data/exceptions/rest_exception.dart';
import 'package:result_dart/result_dart.dart';

import 'package:my_fome/src/domain/dtos/products/product_detail_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';
import 'package:my_fome/src/data/services/client/client_service.dart';

import '../../../domain/repositories/products/produtc_repository.dart';

class ProdutcRepositoryImpl implements ProdutcRepository {
  final ClientService clientService;
  ProdutcRepositoryImpl({
    required this.clientService,
  });

  @override
  AsyncResult<List<ProductDetailDto>> listActive() async {
    try {
      final Response response = await clientService.get(ApiConstant.product);
      final List<dynamic> resultProducts = response.data;
      final List<ProductDetailDto> productsList = resultProducts
          .map((item) => ProductDetailDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(productsList);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: TextConstant.errorListProductsMessage,
            statusCode: e.hashCode),
      );
    }
  }

  @override
  AsyncResult<ProductRegisterDto> register(ProductRegisterDto product) async {
    try {
      final FormData formDataProduct = FormData.fromMap(product.toMap());
      final Response response = await clientService.post(
          ApiConstant.product, formDataProduct,
          requiresAuth: true, contentType: 'multipart/form-data');
      final ProductRegisterDto resultProduct =
          ProductRegisterDto.fromMap(response.data);
      return Success(resultProduct);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorCreatingProductMessage,
          statusCode: e.hashCode,
        ),
      );
    }
  }

  @override
  AsyncResult<ProductUpdateDto> update(
      String id, ProductUpdateDto product) async {
    try {
      final FormData formDataProduct = FormData.fromMap(product.toMap());
      final Response response = await clientService.patch(
          "${ApiConstant.product}/$id", formDataProduct,
          requiresAuth: true, contentType: 'multipart/form-data');
      final ProductUpdateDto resultProduct =
          ProductUpdateDto.fromMap(response.data);
      return Success(resultProduct);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorUpdatingProductMessage,
          statusCode: e.hashCode,
        ),
      );
    }
  }

  @override
  AsyncResult<ProductDetailDto> changeActiveStatus(String id) async {
    try {
      final Response response = await clientService
          .get("${ApiConstant.product}/toggle/$id", requiresAuth: true);
      final ProductDetailDto resultProduct =
          ProductDetailDto.fromMap(response.data);
      return Success(resultProduct);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorSuspendingProductMessage,
          statusCode: e.hashCode,
        ),
      );
    }
  }

  @override
  AsyncResult<List<ProductDetailDto>> listInactive() async {
    try {
      final Response response = await clientService.get(ApiConstant.product);
      final List<dynamic> resultProducts = response.data;
      final List<ProductDetailDto> productsList = resultProducts
          .map((item) => ProductDetailDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(productsList);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: TextConstant.errorListProductsMessage,
            statusCode: e.hashCode),
      );
    }
  }
}
