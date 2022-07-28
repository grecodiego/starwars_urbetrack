import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'package:starwars_urbetrack/screens/Chars/repository/api_repository.dart';
part 'chars_event.dart';
part 'chars_state.dart';

class CharsBloc extends Bloc<CharsEvent, CharsState> {
  final ApiRepository _apiRepository = ApiRepository();
  int numberPage = 1;
  int totalChars = 40;

  CharsBloc() : super(CharsInitialState()) {
    getChars() async {
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
    }

    on<GetCharsList>((event, emit) {
      getChars();
    });

    on<NextPage>((event, emit) async {
      numberPage++;
      getChars();
    });

    on<PreviusPage>((event, emit) async {
      numberPage--;
      getChars();
    });
  }
}
