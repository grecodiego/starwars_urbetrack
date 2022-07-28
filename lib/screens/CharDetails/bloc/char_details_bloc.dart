import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars_urbetrack/screens/CharDetails/models/starship_model.dart';
import 'dart:async';
part 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_event.dart';
part 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_state.dart';

class CharDetailsBloc extends Bloc<CharDetailsEvent, CharDetailsState> {
  CharDetailsBloc() : super(CharDetailsInitialState());

  final StreamController<int> _output = StreamController();

  Stream<int> get pageStream => _output.stream;
  void dispose() {}
}
