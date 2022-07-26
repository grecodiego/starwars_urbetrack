import 'dart:ffi';

import 'package:starwars_urbetrack/screens/CharDetails/models/planet_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/starship_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/vehicles_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/starships_api_provider.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/planets_api_provider.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/vehicles_api_provider.dart';

class DetailsApiRepository {
  final _providerPlanet = PlanetApiProvider();
  final _providerStarship = StarshipApiProvider();
  final _providerVehicle = VehicleApiProvider();

  Future<PlanetModel> fetchPlanet(String planetURL) {
    return _providerPlanet.fetchPlanet(planetURL);
  }

  Future<StarshipModel> fetchStarship(String starshipURL) {
    return _providerStarship.fetchStarship(starshipURL);
  }

  Future<VehiclesModel> fetchVehicle(String starshipURL) {
    return _providerVehicle.fetchVehicle(starshipURL);
  }

  Future GetCharWorld(Results charData) async {
    String uriPlanet = charData.homeworld;
    late PlanetModel charPlanet;
    try {
      if (charData.homeworld != null) {
        charPlanet = await fetchPlanet(uriPlanet);
      }
    } catch (error) {
      throw (error);
    }

    return charPlanet;
  }

  Future getCharStarship(List<String> arrayStarShips) async {
    late StarshipModel starshipDetails;
    List<StarshipModel> charStarshipList = [];
    try {
      if (arrayStarShips != null) {
        for (int i = 0; i < arrayStarShips.length; i++) {
          StarshipModel charStarship = await fetchStarship(arrayStarShips[i]);
          charStarshipList.add(charStarship);
        }
      }
    } catch (error) {
      throw (error);
    }
    return charStarshipList;
  }

  Future getCharVehicle(List<String> arrayVehicles) async {
    late VehiclesModel vehicleDetails;
    List<VehiclesModel> charVehicleList = [];
    try {
      if (arrayVehicles != null) {
        for (int i = 0; i < arrayVehicles.length; i++) {
          VehiclesModel charVehicle = await fetchVehicle(arrayVehicles[i]);
          charVehicleList.add(charVehicle);
        }
      }
    } catch (error) {
      throw (error);
    }
    return charVehicleList;
  }
}
