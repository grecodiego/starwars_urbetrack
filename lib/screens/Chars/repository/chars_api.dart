import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class CharsApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://swapi.dev/api/people/?page=',
    connectTimeout: 20000,
    receiveTimeout: 20000,
  ));

  Future<Response> getRawChars(int numberPage) async {
    Response rawChars = await _dio.request(numberPage.toString(),
        options: Options(method: 'GET'));

    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: print,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 5),
        Duration(seconds: 10),
      ],
    ));

    return rawChars;
  }
}
