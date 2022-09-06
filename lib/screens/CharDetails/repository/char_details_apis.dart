import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class DetailsAPi {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: 20000,
    receiveTimeout: 20000,
  ));

  Future<Response> getRaw(String url) async {
    Response raw = await _dio.get(url, options: Options(method: 'GET'));

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
    return raw;
  }
}

class ReportAPI {
  final Dio _dio = Dio();

  Future<Response> postReport(
      {required String reportURL, required Map data}) async {
    Response rawReport = await _dio.post(reportURL, data: data);
    return rawReport;
  }
}
