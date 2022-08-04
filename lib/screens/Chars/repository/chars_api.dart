import 'package:dio/dio.dart';

class CharsApi {
  final Dio _dio = Dio();
  final String _url = 'https://swapi.dev/api/people/?page=';

  Future<Response> getRawChars(int numberPage) async {
    try {
      Response rawChars = await _dio.get(_url + numberPage.toString());
      return rawChars;
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}
