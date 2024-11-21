// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/core/dtos/user/detail_user_dto.dart';

import 'package:my_fome/src/core/viewmodels/user/user_view_model.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  final UserViewModel viewModel;
  UserControllerBase({
    required this.viewModel,
  });

  @computed
  DetailUserDto? get user => viewModel.user;

  @action
  detail() async {
    await viewModel.detail();
  }
}
