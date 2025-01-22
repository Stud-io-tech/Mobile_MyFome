// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

import 'package:my_fome/src/data/services/auth/auth_google_service.dart';

part 'auth_google_controller.g.dart';

class AuthGoogleController = AuthGoogleControllerBase
    with _$AuthGoogleController;

abstract class AuthGoogleControllerBase with Store {
  final AuthGoogleService authGoogleService;
  AuthGoogleControllerBase({
    required this.authGoogleService,
  });

  @observable
  GoogleSignInAccount? googleCredentials;

  @action
  login() async {
    googleCredentials = await authGoogleService.login();
  }

  @action
  logout() async {
    await authGoogleService.logout();
  }
}
