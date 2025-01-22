// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:my_fome/src/constants/api_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/data/exceptions/rest_exception.dart';
import 'package:my_fome/src/domain/dtos/users/user_login_dto.dart';
import 'package:my_fome/src/domain/dtos/users/user_register_dto.dart';
import 'package:my_fome/src/domain/repositories/users/user_repository.dart';
import 'package:result_dart/result_dart.dart';

import 'package:my_fome/src/data/services/client/client_service.dart';


class UserRepositoryImpl implements UserRepository {
  final ClientService clientService;
  UserRepositoryImpl({
    required this.clientService,
  });

  @override
  AsyncResult<UserLoginDto> login(UserLoginDto login) async {
    try {
      final Response response =
          await clientService.post(ApiConstant.login, login);
      final UserLoginDto resultLogin = UserLoginDto.fromMap(response.data);
      return Success(resultLogin);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: TextConstant.errorLoggingAccountMessage,
            statusCode: e.hashCode),
      );
    }
  }

  @override
  AsyncResult<UserRegisterDto> register(UserRegisterDto register) async {
    try {
      final Response response =
          await clientService.post(ApiConstant.register, register);
      final UserRegisterDto resultRegister =
          UserRegisterDto.fromMap(response.data);
      return Success(resultRegister);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorCreatingAccountMessage,
          statusCode: e.hashCode,
        ),
      );
    }
  }
}
