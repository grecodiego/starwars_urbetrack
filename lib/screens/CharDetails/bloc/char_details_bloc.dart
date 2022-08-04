import 'package:bloc/bloc.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/planet_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/starship_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/vehicles_model.dart';
import 'dart:async';

import 'package:starwars_urbetrack/screens/CharDetails/repository/api_repository.dart';

import '../../Chars/model/chars_model.dart';
part 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_event.dart';
part 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_state.dart';

class CharDetailsBloc extends Bloc<CharDetailsEvent, CharDetailsState> {
  final DetailsApiRepository _apiRepository = DetailsApiRepository();
  CharDetails charDetails = CharDetails();

  CharDetailsBloc() : super(CharDetailsInitialState()) {
    getDetails(Results charData) async {
      emit(CharDetailsStateLoading());
      try {
        if (charData.homeworld != '') {
          PlanetModel charPlanet = await _apiRepository.GetCharWorld(charData);
          charDetails.charWorldName = charPlanet.name!;
        }
        if (charData.starships.isNotEmpty) {
          charDetails.charStarships =
              await _apiRepository.getCharStarship(charData.starships);
        }
        if (charData.homeworld != '') {
          charDetails.charVehicles =
              await _apiRepository.getCharVehicle(charData.vehicles);
        }
        emit(CharDetailsStateLoaded(charDetails));
      } on NetworkError {
        emit(CharDetailsStateError(
            "Failed to fetch data. is your device online?"));
      }
    }

    on<GetCharDetails>((event, emit) {
      getDetails(event.charData);
    });
  }
}

class CharDetails {
  String charWorldName = '';
  List<StarshipModel> charStarships = [];
  List<VehiclesModel> charVehicles = [];
}
