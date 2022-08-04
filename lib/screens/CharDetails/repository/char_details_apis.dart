import 'package:dio/dio.dart';

class PlanetApi {
  final Dio _dio = Dio();

  Future<Response> getRawPlanet(String planetURL) async {
    try {
      Response rawPlanet = await _dio.get(planetURL);
      return rawPlanet;
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}

class StarshipsAPI {
  final Dio _dio = Dio();

  Future<Response> getRawStarships(String starshipURL) async {
    try {
      Response rawStarships = await _dio.get(starshipURL);
      return rawStarships;
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}

class VehiclesAPI {
  final Dio _dio = Dio();

  Future<Response> getRawVehicles(String vehicleURL) async {
    try {
      Response rawVehicles = await _dio.get(vehicleURL);
      return rawVehicles;
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}

class ReportAPI {
  final Dio _dio = Dio();

  Future<Response> postReport(
      {required String reportURL, required Map data}) async {
    try {
      Response rawReport = await _dio.post(reportURL, data: data);

      return rawReport;
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}

class NetworkError extends Error {}
