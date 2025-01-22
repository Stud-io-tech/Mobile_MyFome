import 'package:dio/dio.dart';
import 'package:my_fome/src/data/Interceptors/auth_interceptor.dart';

import 'client_service.dart';

class ClientServiceImpl implements ClientService {
  final Dio dio;
  ClientServiceImpl() : dio = Dio() {
    dio.interceptors.add(AuthInterceptor());
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
  Future patch(String uri, Object value,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType}) async {
    return await dio.patch(uri,
        data: value,
        options: Options(
            extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }

}