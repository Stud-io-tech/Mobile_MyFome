// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:my_fome/src/core/constants/api_constant.dart';
import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/dtos/productCategory/product_category_page_dto.dart';
import 'package:my_fome/src/core/dtos/productCategory/product_category_save_dto.dart';
import 'package:my_fome/src/core/exceptions/rest_exception.dart';
import 'package:my_fome/src/core/services/client/client_service.dart';

import './produc_category_repository.dart';

class ProducCategoryRepositoryImpl implements ProducCategoryRepository {
  final ClientService clientService;
  ProducCategoryRepositoryImpl({
    required this.clientService,
  });

  @override
  Future<ProductCategoryPageDto> findAllpage() async {
    try {
      final Response response = await clientService.get(
          ApiConstant.listProductCategory,
          requiresAuth: true,
          contentType: 'application/json');
      return ProductCategoryPageDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

  @override
  Future<ProductCategorySaveDto> save(ProductCategorySaveDto model) async {
    final Response response = await clientService.post(
        ApiConstant.registerProductCategory, model.toJson());
    return ProductCategorySaveDto.fromJson(response.data);
  }
}
