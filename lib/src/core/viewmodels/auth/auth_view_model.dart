// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jwt_decode/jwt_decode.dart';
import 'package:my_fome/src/core/constants/local_storage_constant.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/dtos/user/login_user_dto.dart';
import 'package:my_fome/src/core/dtos/user/register_user_dto.dart';
import 'package:my_fome/src/core/exceptions/rest_exception.dart';
import 'package:my_fome/src/core/repositories/user/user_repository.dart';
import 'package:my_fome/src/core/services/auth/social/social_auth_service.dart';
import 'package:my_fome/src/core/services/local/local_store_service.dart';
import 'package:my_fome/src/core/services/messages/message_service.dart';

part 'auth_view_model.g.dart';

class AuthViewModel = AuthViewModelBase with _$AuthViewModel;

abstract class AuthViewModelBase with Store {
  final UserRepository userRepository;
  final MessageService messageService;
  final SocialAuthService socialAuthService;
  final LocalStoreService localStoreService;

  AuthViewModelBase({
    required this.userRepository,
    required this.messageService,
    required this.socialAuthService,
    required this.localStoreService,
  });

  @observable
  bool isLoading = false;

  @observable
  GoogleSignInAccount? googleCredentials;

  @observable
  String? idUser;


  @action
  Future<void> idUserLoad() async {
    await localStoreService.get(LocalStorageConstant.idUser).then((value) {
      if (value != null) idUser = value;
    });
  }


  @action
  Future<void> login() async {
    try {
      isLoading = true;
      googleCredentials = await socialAuthService.login();
      final model = LoginUserDto(email: googleCredentials!.email);
      final response = await userRepository.login(model);
      final accessToken = response.data['token'];
      final payload = Jwt.parseJwt(accessToken);
      idUser = payload['id'];
      await localStoreService.put(LocalStorageConstant.authKey, accessToken);
      await localStoreService.put(LocalStorageConstant.idUser, idUser);
    } on RestException catch (e) {
      if (e.response?.statusCode == 403) {
        await register();
      } else {
        await logout();
        messageService.showMessageError(e.message);
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> register() async {
    bool hasError = false;
    try {
      isLoading = true;
      final model = RegisterUserDto(
        name: googleCredentials!.displayName!,
        email: googleCredentials!.email,
        photo: googleCredentials?.photoUrl,
      );
      await userRepository.register(model);
    } on RestException catch (e) {
      hasError = true;
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
      if (!hasError) {
        messageService.showMessageSuccess(TextConstant.accountVerification);
      }
    }
  }

  @action
  Future<void> logout() async {
    await localStoreService.delete(LocalStorageConstant.idUser);
    await localStoreService.delete(LocalStorageConstant.authKey);
    await socialAuthService.logout();
    await idUserLoad();
  }
}
