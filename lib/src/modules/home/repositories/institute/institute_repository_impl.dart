// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:my_fome/src/core/constants/api_constant.dart';
import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/dtos/institute/institute_page_dto.dart';
import 'package:my_fome/src/core/exceptions/rest_exception.dart';
import 'package:my_fome/src/core/services/client/client_service.dart';

import './institute_repository.dart';

class InstituteRepositoryImpl implements InstituteRepository {
  final ClientService service;
  InstituteRepositoryImpl({
    required this.service,
  });

  @override
  Future<InstitutePageDto> findAllPage() async {
    try {
      final Response response = await service.get(
          ApiConstant.listInstituteValid,
          contentType: 'application/json',
          requiresAuth: true);
      return InstitutePageDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }
}
