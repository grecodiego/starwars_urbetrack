import 'package:dio/dio.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'package:starwars_urbetrack/screens/Chars/repository/chars_api.dart';

class CharsRepository {
  final CharsApi charsApi = CharsApi();

  Future<ApiModel> getCharsList(int numberPage) async {
    Response rawChars = await charsApi.getRawChars(numberPage);
    final ApiModel charsList = ApiModel.fromJson(rawChars.data);
    print(charsList);
    return charsList;
  }
}
