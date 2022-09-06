import 'package:dio/dio.dart';

class DetailsAPi {
  final Dio _dio = Dio();

  Future<Response> getRawPlanet(String planetURL) async {
    Response rawPlanet = await _dio.get(planetURL);
    return rawPlanet;
  }

  Future<Response> getRawStarships(String starshipURL) async {
    Response rawStarships = await _dio.get(starshipURL);
    return rawStarships;
  }

  Future<Response> getRawVehicles(String vehicleURL) async {
    Response rawVehicles = await _dio.get(vehicleURL);
    return rawVehicles;
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

class NetworkError extends Error {}
