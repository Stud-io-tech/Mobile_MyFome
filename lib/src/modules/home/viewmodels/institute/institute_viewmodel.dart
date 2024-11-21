// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_getit/flutter_getit.dart';
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/core/controllers/auth/auth_controller.dart';
import 'package:my_fome/src/core/controllers/route/route_controller.dart';
import 'package:my_fome/src/core/dtos/institute/institute_page_dto.dart';
import 'package:my_fome/src/core/exceptions/rest_exception.dart';
import 'package:my_fome/src/core/services/messages/message_service.dart';
import 'package:my_fome/src/modules/home/repositories/institute/institute_repository.dart';

part 'institute_viewmodel.g.dart';

class InstituteViewmodel = InstituteViewmodelBase with _$InstituteViewmodel;

abstract class InstituteViewmodelBase with Store {
  final InstituteRepository repository;
  final MessageService messageService;
  InstituteViewmodelBase({
    required this.repository,
    required this.messageService,
  });

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @observable
  bool isLoading = false;

  @observable
  InstitutePageDto? instituteList;

  @action
  Future<void> listInstitutePage() async {
    try {
      isLoading = true;
      instituteList = await repository.findAllPage();
    } on RestException catch (e) {
      await authController.logout();
      await routeController.routeClean();
      await authController.accessTokenLoad();
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }
}
