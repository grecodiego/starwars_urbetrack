import 'package:dio/dio.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/planet_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/starship_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/vehicles_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/char_details_apis.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';

class DetailsApiRepository {
  final PlanetApi planetAPI = PlanetApi();
  final StarshipsAPI starshipAPI = StarshipsAPI();
  final VehiclesAPI vehicleAPI = VehiclesAPI();

  // ----------------------- GET -----------------------

  Future<PlanetModel> getCharPlanet(Results charData) async {
    final Response rawPlanet = await planetAPI.getRawPlanet(charData.homeworld);

    final PlanetModel charPlanet = PlanetModel.fromJson(rawPlanet.data);

    return charPlanet;
  }

  Future<List<StarshipModel>> getCharStarhips(
      List<String> arrayStarShips) async {
    List<StarshipModel> charStarshipList = [];
    for (int i = 0; i < arrayStarShips.length; i++) {
      final Response rawStarship =
          await starshipAPI.getRawStarships(arrayStarShips[i]);
      final StarshipModel charStarship =
          StarshipModel.fromJson(rawStarship.data);

      charStarshipList.add(charStarship);
    }
    return charStarshipList;
  }

  Future<List<VehiclesModel>> getCharVehicles(
      List<String> arrayVehicles) async {
    List<VehiclesModel> charVehiclesList = [];
    for (int i = 0; i < arrayVehicles.length; i++) {
      final Response rawStarship =
          await vehicleAPI.getRawVehicles(arrayVehicles[i]);
      final VehiclesModel charVehicles =
          VehiclesModel.fromJson(rawStarship.data);

      charVehiclesList.add(charVehicles);
    }
    return charVehiclesList;
  }
}

// ----------------------- POST -----------------------

class ReportRepository {
  final Dio _dio = Dio();
  final ReportAPI reportAPI = ReportAPI();

  final dateNow = DateTime.now();

  var reportURL = 'https://jsonplaceholder.typicode.com/posts';

  Future<Response> sendReport(String characterName) async {
    final Response rawReport = await reportAPI.postReport(
        reportURL: reportURL,
        data: {
          'userId': 007,
          'dateTime': dateNow.toString(),
          'character_name': characterName
        });
    return rawReport;
  }
}

class NetworkError extends Error {}
