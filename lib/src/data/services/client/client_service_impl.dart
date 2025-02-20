// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:my_fome/src/data/Interceptors/auth_interceptor.dart';
import 'package:my_fome/src/data/services/local/local_storage_service.dart';

import 'client_service.dart';

class ClientServiceImpl implements ClientService {
  final Dio dio;
  final LocalStorageService localStorageService;
  ClientServiceImpl(
    this.localStorageService,
  ) : dio = Dio() {
    dio.interceptors
        .add(AuthInterceptor(localStorageService: localStorageService));
  }

  @override
  Future get(String uri,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType}) async {
    return await dio.get(uri,
        options: Options(
            extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }

  @override
  Future post(String uri, Object value,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType}) async {
    return await dio.post(uri,
        data: value,
        options: Options(
            extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }

  @override
  Future delete(String uri,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType}) async {
    return await dio.delete(uri,
        options: Options(
            extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }

  @override
  Future put(String uri,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType}) async {
    return await dio.put(uri,
        options: Options(
            extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }
}
