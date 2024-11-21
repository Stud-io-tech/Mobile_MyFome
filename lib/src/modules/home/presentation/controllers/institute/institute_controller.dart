// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:my_fome/src/core/dtos/institute/institute_page_dto.dart';
import 'package:my_fome/src/modules/home/viewmodels/institute/institute_viewmodel.dart';

part 'institute_controller.g.dart';

class InstituteController = InstituteControllerBase with _$InstituteController;

abstract class InstituteControllerBase with Store {
  final InstituteViewmodel viewmodel;
  InstituteControllerBase({
    required this.viewmodel,
  });

  @computed
  InstitutePageDto? get instituteListPage => viewmodel.instituteList;

  @action
  init() async {
    await viewmodel.listInstitutePage();
  }
}
