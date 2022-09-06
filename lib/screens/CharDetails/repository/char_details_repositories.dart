import 'package:dio/dio.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/char_details_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/planet_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/starship_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/vehicles_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/char_details_apis.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';

class DetailsApiRepository {
  final DetailsAPi detailsApi = DetailsAPi();

  // ----------------------- GET -----------------------

  Future getCharDetails(Results charData) async {
    CharDetails charDetails = CharDetails();

    if (charData.homeworld != '') {
      final Response rawPlanet =
          await detailsApi.getRawPlanet(charData.homeworld);
      final PlanetModel charPlanet = PlanetModel.fromJson(rawPlanet.data);
      charDetails.charWorldName = charPlanet.name!;
    }

    if (charData.starships.isNotEmpty) {
      for (int i = 0; i < charData.starships.length; i++) {
        final Response rawStarship =
            await detailsApi.getRawStarships(charData.starships[i]);
        final StarshipModel charStarship =
            StarshipModel.fromJson(rawStarship.data);
        charDetails.charStarships.add(charStarship.name);
      }
    }

    if (charData.vehicles.isNotEmpty) {
      for (int i = 0; i < charData.vehicles.length; i++) {
        final Response rawVehicles =
            await detailsApi.getRawVehicles(charData.vehicles[i]);
        final VehiclesModel charVehicles =
            VehiclesModel.fromJson(rawVehicles.data);
        charDetails.charVehicles.add(charVehicles.name);
      }
    }
    return charDetails;
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
