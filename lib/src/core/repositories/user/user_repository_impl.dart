// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:my_fome/src/core/constants/api_constant.dart';
import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/dtos/user/detail_user_dto.dart';
import 'package:my_fome/src/core/dtos/user/login_user_dto.dart';
import 'package:my_fome/src/core/exceptions/rest_exception.dart';

import 'package:my_fome/src/core/services/client/client_service.dart';
import 'package:my_fome/src/core/dtos/user/register_user_dto.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientService clientService;
  UserRepositoryImpl({
    required this.clientService,
  });

  @override
  Future<Response> login(LoginUserDto model) async {
    try {
      return await clientService.post(ApiConstant.userLogin, model.toJson());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw RestException(
            TextConstant.accountValidationError, e.hashCode, e.response);
      }
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

  @override
  Future<RegisterUserDto> register(RegisterUserDto model) async {
    try {
      return await clientService.post(ApiConstant.userRegister, model.toJson());
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

  @override
  Future<DetailUserDto> detail(String id) async {
    try {
      final Response response = await clientService.get(
          "${ApiConstant.userDetail}/$id",
          requiresAuth: true,
          contentType: 'application/json');
      return DetailUserDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }
}
