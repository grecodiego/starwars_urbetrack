import 'package:bloc/bloc.dart';
import 'package:starwars_urbetrack/data/network/dio_exceptions.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/char_details_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/planet_model.dart';
import 'dart:async';
import 'package:starwars_urbetrack/screens/CharDetails/repository/char_details_repositories.dart';
import '../../Chars/model/chars_model.dart';
import 'package:dio/dio.dart';
part 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_event.dart';
part 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_state.dart';

class CharDetailsBloc extends Bloc<CharDetailsEvent, CharDetailsState> {
  final DetailsApiRepository _apiRepository = DetailsApiRepository();
  CharDetails charDetails = CharDetails();

  CharDetailsBloc() : super(CharDetailsStateLoading()) {
    getDetails(Results charData) async {
      emit(CharDetailsStateLoading());
      try {
        charDetails = await _apiRepository.getCharDetails(charData);
        emit(CharDetailsStateLoaded(charDetails));
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        emit(CharDetailsStateError(errorMessage));
      }
    }

    on<GetCharDetails>((event, emit) {
      getDetails(event.charData);
    });
  }
}
