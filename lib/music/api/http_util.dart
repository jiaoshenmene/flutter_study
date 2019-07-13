import 'package:dio/dio.dart';
import 'package:flutter_l1/music/base/app_config.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  static HttpUtil getInstance() {
    if (instance == null) {
      instance = HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    dio = Dio()
      ..options = BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: 30000,
          receiveTimeout: 30000)
      ..interceptors.add(HeaderInterceptor());
  }
}

class HeaderInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    final token = AppConfig.userTools.getUserToken();
    if (token != null && token.length > 0) {
      options.headers
          .putIfAbsent('Authorization', () => 'Bearer' + ' ' + token);
    }
    return super.onRequest(options);
  }
}
