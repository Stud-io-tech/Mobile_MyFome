import 'env/env.dart';

final class ApiConstant {
  static final String baseUrl = Env.baseUrl;
  static final String login = "$baseUrl/login";
  static final String user = "$baseUrl/user";
  static final String register = "$baseUrl/register";
  static final String store = "$baseUrl/store";
  static final String product = "$baseUrl/product";
}
