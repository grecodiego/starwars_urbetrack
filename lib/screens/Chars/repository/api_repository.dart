import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'chars_api_provider.dart';

class ApiRepository {
  final _providerChars = CharsApiProvider();

  Future<ApiModel> fetchCharsList(int numberPage) {
    return _providerChars.fetchCharsList(numberPage);
  }
}

class NetworkError extends Error {}
