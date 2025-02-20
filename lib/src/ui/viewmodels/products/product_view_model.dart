import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/data/services/messages/result_message_service.dart';
import 'package:my_fome/src/domain/dtos/products/product_detail_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';
import 'package:my_fome/src/domain/repositories/products/produtc_repository.dart';
part 'product_view_model.g.dart';

class ProductViewModel = ProductViewModelBase with _$ProductViewModel;

abstract class ProductViewModelBase with Store {
  final ProdutcRepository productRepository;
  final ResultMessageService resultMessageService;
  ProductViewModelBase({
    required this.productRepository,
    required this.resultMessageService,
  });

  @observable
  bool isLoading = false;

  @observable
  List<ProductDetailDto>? productsListActive;

  @observable
  List<ProductDetailDto>? productsListInactive;

  @observable
  List<ProductDetailDto>? productFilterListActive;

  @observable
  List<ProductDetailDto>? productFilterListInactive;

  @observable
  List<ProductDetailDto>? productsByStore;

  @observable
  int activeFounds = 0;

  @observable
  int inactiveFounds = 0;

  @action
  Future listActive() async {
    isLoading = true;
    final result = await productRepository.listActive();
    result.fold(
      (success) {
        productsListActive = success;
        productFilterListActive = productsListActive;
        activeFounds = productFilterListActive?.length ?? 0;
      },
      (failure) => resultMessageService
          .showMessageError(TextConstant.errorListProductsMessage),
    );
    isLoading = false;
  }

  @action
  Future listInactive() async {
    isLoading = true;
    final result = await productRepository.listInactive();
    result.fold(
      (success) {
        productsListInactive = success;
        productFilterListInactive = productsListInactive;
        inactiveFounds = productFilterListInactive?.length ?? 0;
      },
      (failure) => resultMessageService
          .showMessageError(TextConstant.errorListProductsMessage),
    );
    isLoading = false;
  }

  @action
  listFilterByName(String name) {
    if (name.isNotEmpty) {
      productFilterListActive = productsListActive
          ?.where((element) =>
              element.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
      productFilterListInactive = productsListInactive
          ?.where((element) =>
              element.name.toLowerCase().contains(name.toLowerCase()))
          .toList();

      activeFounds = productFilterListActive?.length ?? 0;
      inactiveFounds = productFilterListInactive?.length ?? 0;
    } else {
      productFilterListActive = productsListActive;
      productFilterListInactive = productsListInactive;

      activeFounds = productFilterListActive?.length ?? 0;
      inactiveFounds = productFilterListInactive?.length ?? 0;
    }
  }

  @action
  Future register(ProductRegisterDto product, XFile image) async {
    isLoading = true;
    final result = await productRepository.register(product, image);
    result.fold(
      (success) => resultMessageService.showMessageSuccess(
          TextConstant.sucessCreatingProductTitle,
          TextConstant.sucessCreatingProductMessage,
          IconConstant.success),
      resultMessageService
          .showMessageError(TextConstant.errorCreatingProductMessage),
    );
    isLoading = false;
  }

  @action
  Future update(String id, ProductUpdateDto product, {XFile? image}) async {
    isLoading = true;
    final result = await productRepository.update(id, product, image: image);
    result.fold(
      (success) => resultMessageService.showMessageSuccess(
          TextConstant.sucessUpdatingProductTitle,
          TextConstant.sucessUpdatingProductMessage,
          IconConstant.edit),
      resultMessageService
          .showMessageError(TextConstant.errorUpdatingProductMessage),
    );
    isLoading = false;
  }

  Future toggleActive(String id) async {
    isLoading = true;
    final result = await productRepository.toggleActive(id);
    result.fold(
      (success) {
        if (success.active) {
          resultMessageService.showMessageSuccess(
              TextConstant.sucessRestoreProductTitle,
              TextConstant.sucessRestoreProductMessage,
              IconConstant.restore);
        } else {
          resultMessageService.showMessageSuccess(
              TextConstant.sucessSuspendingProductTitle,
              TextConstant.sucessSuspendingProductMessage,
              IconConstant.remove);
        }
      },
      (failure) => resultMessageService
          .showMessageError(TextConstant.errorExecutingProductMessage),
    );
    isLoading = false;
  }

  Future listByStore(String id) async {
    isLoading = true;
    final result = await productRepository.listByStore(id);
    result.fold(
      (success) => productsByStore = success,
      (failure) => resultMessageService
          .showMessageError(TextConstant.errorListProductsMessage),
    );
    isLoading = false;
  }
}
