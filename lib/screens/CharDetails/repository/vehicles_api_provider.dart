import 'package:dio/dio.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/vehicles_model.dart';

class VehicleApiProvider {
  final Dio _dio = Dio();

  Future<VehiclesModel> fetchVehicle(String vehicleURL) async {
    try {
      Response response = await _dio.get(vehicleURL);
      return VehiclesModel.fromJson(response.data);
    } catch (error, stacktrace) {
      throw ('Data not found $error, stackTrace $stacktrace');
    }
  }
}

class NetworkError extends Error {}
