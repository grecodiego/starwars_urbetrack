import 'package:dio/dio.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/starship_model.dart';

class StarshipApiProvider {
  final Dio _dio = Dio();

  Future<StarshipModel> fetchStarship(String starshipURL) async {
    try {
      Response response = await _dio.get(starshipURL);
      return StarshipModel.fromJson(response.data);
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}

class NetworkError extends Error {}
