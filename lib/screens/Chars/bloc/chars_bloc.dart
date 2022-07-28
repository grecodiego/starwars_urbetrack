import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'dart:async';

import 'package:starwars_urbetrack/screens/Chars/repository/api_repository.dart';
part 'chars_event.dart';
part 'chars_state.dart';

class CharsBloc extends Bloc<CharsEvent, CharsState> {
  CharsBloc() : super(CharsInitialState()) {
    _input.stream.listen(_onEvent);
    on<GetCharsList>((event, emit) async {
      try {
        emit(CharsStateLoading());
        final charsList = await _apiRepository.fetchCharsList(numberPage);
        totalChars = charsList.count;
        emit(CharsStateLoaded(charsList.results));
        if (charsList.error != null) {
          emit(CharsStateError(charsList.error));
        }
      } on NetworkError {
        emit(const CharsStateError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
  final StreamController<CharsBloc> _input = StreamController();
  final StreamController<int> _output = StreamController();
  Stream<int> get pageStream => _output.stream;
  StreamSink<CharsBloc> get sendEvent => _input.sink;

  int numberPage = 1;
  int totalChars = 20;

  void dispose() {
    _input.close();
    _output.close();
  }

  void _onEvent(CharsBloc event) {
    if (event is NextPage) {
      numberPage++;
    } else {
      if (numberPage != 1) {
        numberPage--;
      }
    }

    _output.add(numberPage);
  }

  final ApiRepository _apiRepository = ApiRepository();
}

class NextPage extends CharsBloc {}

class PreviusPage extends CharsBloc {}
