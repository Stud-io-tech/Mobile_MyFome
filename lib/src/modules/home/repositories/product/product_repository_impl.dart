// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:my_fome/src/core/constants/api_constant.dart';
import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/dtos/product/product_detail_dto.dart';
import 'package:my_fome/src/core/dtos/product/product_page_dto.dart';
import 'package:my_fome/src/core/exceptions/rest_exception.dart';
import 'package:my_fome/src/core/services/client/client_service.dart';

import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ClientService service;
  ProductRepositoryImpl({
    required this.service,
  });

  @override
  Future<ProductPageDto> findAllPageByProductCategory(
      String id) async {
    try {
      final Response response = await service.get(
        "${ApiConstant.listProductByProductCategory}/$id",
        requiresAuth: true,
        contentType: 'application/json',
      );
      return ProductPageDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

    @override
  Future<ProductDetailDto> detail(String id) async{
       try {
      final Response response = await service.get(
          "${ApiConstant.detailProduct}/$id",
          requiresAuth: true,
          contentType: 'application/json');
      return  ProductDetailDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }
}
