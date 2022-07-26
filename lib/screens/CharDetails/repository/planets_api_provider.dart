import 'package:dio/dio.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/planet_model.dart';

class PlanetApiProvider {
  final Dio _dio = Dio();

  Future<PlanetModel> fetchPlanet(String planetURL) async {
    try {
      Response response = await _dio.get(planetURL);
      return PlanetModel.fromJson(response.data);
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}
