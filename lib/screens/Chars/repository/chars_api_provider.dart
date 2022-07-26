import 'package:dio/dio.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';

class CharsApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://swapi.dev/api/people/?page=';

  Future<ApiModel> fetchCharsList(int numberPage) async {
    try {
      Response response = await _dio.get(_url + numberPage.toString());
      return ApiModel.fromJson(response.data);
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}
