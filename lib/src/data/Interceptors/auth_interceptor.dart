import 'package:dio/dio.dart';

final class AuthInterceptor extends InterceptorsWrapper {
  late String? accesstoken;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['requiredAuth']) {
      accesstoken = 'authKey';
      if (accesstoken != null) {
        options.headers['Authorization'] = 'Bearer $accesstoken';
      }
    }
    return handler.next(options);
  }
}
