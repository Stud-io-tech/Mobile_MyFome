// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/domain/dtos/stores/store_detail_dto.dart';

import 'package:my_fome/src/ui/viewmodels/stores/store_view_model.dart';

part 'store_controller.g.dart';

class StoreController = StoreControllerBase with _$StoreController;

abstract class StoreControllerBase with Store {
  final StoreViewModel storeViewModel;
  StoreControllerBase({
    required this.storeViewModel,
  });

  @computed
  int get founds => storeViewModel.founds;

  @computed
  bool get isLoading => storeViewModel.isLoading;

  @computed
  List<StoreDetailDto>? get stores => storeViewModel.storeFilterList;

  @computed
  StoreDetailDto? get store => storeViewModel.store;


  listStore() async {
    await storeViewModel.list();
  }

  filterStores(String name) {
    storeViewModel.listFilterByName(name);
  }

  detailStore(String id) async {
    await storeViewModel.detail(id);
  }
}
