import 'package:dio/dio.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/planet_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/starship_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/vehicles_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/report_api_service.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/starships_api_provider.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/planets_api_provider.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/vehicles_api_provider.dart';

class DetailsApiRepository {
  final _providerPlanet = PlanetApiProvider();
  final _providerStarship = StarshipApiProvider();
  final _providerVehicle = VehicleApiProvider();
  final _reportService = ReportApiService();

// ----------------------- GET -----------------------

  Future GetCharWorld(Results charData) async {
    String uriPlanet = charData.homeworld;
    late PlanetModel charPlanet;
    try {
      if (charData.homeworld != null) {
        charPlanet = await _providerPlanet.fetchPlanet(uriPlanet);
      }
    } catch (error) {
      rethrow;
    }
    return charPlanet;
  }

  Future getCharStarship(List<String> arrayStarShips) async {
    List<StarshipModel> charStarshipList = [];
    try {
      for (int i = 0; i < arrayStarShips.length; i++) {
        StarshipModel charStarship =
            await _providerStarship.fetchStarship(arrayStarShips[i]);
        charStarshipList.add(charStarship);
      }
    } catch (error) {
      rethrow;
    }
    return charStarshipList;
  }

  Future getCharVehicle(List<String> arrayVehicles) async {
    List<VehiclesModel> charVehicleList = [];
    try {
      if (arrayVehicles != null) {
        for (int i = 0; i < arrayVehicles.length; i++) {
          VehiclesModel charVehicle =
              await _providerVehicle.fetchVehicle(arrayVehicles[i]);
          charVehicleList.add(charVehicle);
        }
      }
    } catch (error) {
      rethrow;
    }
    return charVehicleList;
  }

// ----------------------- POST -----------------------

  Future reportChar(String charName) async {
    dynamic responseReport;
    try {
      if (charName != '') {
        var responseReport = await _reportService.fetchPost(charName);
        return responseReport;
      }
    } catch (error) {
      rethrow;
    }
    return responseReport;
  }
}

class NetworkError extends Error {}
