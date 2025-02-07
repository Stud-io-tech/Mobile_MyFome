// auth_interceptor.dart
import 'package:dio/dio.dart';
import 'package:my_fome/src/constants/local_storage_constant.dart';
import 'package:my_fome/src/data/services/local/local_storage_service.dart';

final class AuthInterceptor extends InterceptorsWrapper {
  final LocalStorageService localStorageService;

  AuthInterceptor({required this.localStorageService});

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['requiredAuth'] == true) {
      final accessToken =
          await localStorageService.get(LocalStorageConstant.accesstoken);

      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    return handler.next(options);
  }
}
