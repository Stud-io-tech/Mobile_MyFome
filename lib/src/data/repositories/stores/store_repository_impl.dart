// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:my_fome/src/constants/api_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/data/exceptions/rest_exception.dart';
import 'package:result_dart/result_dart.dart';
import 'package:my_fome/src/domain/dtos/stores/store_detail_dto.dart';
import 'package:my_fome/src/domain/dtos/stores/store_register_dto.dart';
import 'package:my_fome/src/domain/dtos/stores/store_update_dto.dart';
import 'package:my_fome/src/data/services/client/client_service.dart';

import '../../../domain/repositories/stores/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final ClientService clientService;
  StoreRepositoryImpl({
    required this.clientService,
  });

  @override
  AsyncResult<List<StoreDetailDto>> list() async{
        try {
      final Response response = await clientService.get(ApiConstant.store);
      final List<dynamic> resultStores = response.data;
      final List<StoreDetailDto> storesList = resultStores
          .map((item) => StoreDetailDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(storesList);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: TextConstant.errorListStoresMessage,
            statusCode: e.hashCode),
      );
    }
  }

  @override
  AsyncResult<StoreRegisterDto> register(StoreRegisterDto store) async{
    try {
      final FormData formDataStore = FormData.fromMap(store.toMap());
      final Response response = await clientService.post(
          ApiConstant.store, formDataStore,
          requiresAuth: true, contentType: 'multipart/form-data');
      final StoreRegisterDto resultProduct =
          StoreRegisterDto.fromMap(response.data);
      return Success(resultProduct);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorCreatingStoreMessage,
          statusCode: e.hashCode,
        ),
      );
    }
  }

  @override
  AsyncResult<StoreUpdateDto> update(String id, StoreUpdateDto store) async{
    try {
      final FormData formDataStore = FormData.fromMap(store.toMap());
      final Response response = await clientService.patch(
          "${ApiConstant.store}/$id", formDataStore,
          requiresAuth: true, contentType: 'multipart/form-data');
      final StoreUpdateDto resultStore =
          StoreUpdateDto.fromMap(response.data);
      return Success(resultStore);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorUpdatingStoreMessage,
          statusCode: e.hashCode,
        ),
      );
    }
  }

}
