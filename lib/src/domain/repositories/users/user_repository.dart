import 'package:my_fome/src/domain/dtos/users/user_login_dto.dart';
import 'package:my_fome/src/domain/dtos/users/user_register_dto.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class UserRepository {
  AsyncResult<UserLoginDto> login(UserLoginDto login);
  AsyncResult<UserRegisterDto> register(UserRegisterDto register);
}
