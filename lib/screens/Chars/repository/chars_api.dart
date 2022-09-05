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
    //!No internet connection
    //throw SocketException('No internet');

    Response rawChars = await _dio.request(numberPage.toString(),
        options: Options(method: 'GET'));

    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 5), // wait 2 sec before second retry
        Duration(seconds: 10), // wait 3 sec before third retry
      ],
    ));

    /// Sending a failing request for 3 times with 1s, then 2s, then 3s interval
    //await _dio.request(numberPage.toString());

    return rawChars;
  }
}
