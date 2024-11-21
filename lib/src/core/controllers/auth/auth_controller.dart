// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/core/viewmodels/auth/auth_view_model.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final AuthViewModel authViewModel;
  AuthControllerBase({
    required this.authViewModel,
  });

  @computed
  String? get idUser => authViewModel.idUser;

  @computed
  bool get isLoading => authViewModel.isLoading;

  @action
  login() async {
    await authViewModel.login();
    await accessTokenLoad();
  }

  @action
  logout() async {
    await authViewModel.logout();
    await accessTokenLoad();
  }

  @action
  accessTokenLoad() async {
    await authViewModel.idUserLoad();
  }

}
