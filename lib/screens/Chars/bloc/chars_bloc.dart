import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars_urbetrack/data/network/dio_exceptions.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'package:starwars_urbetrack/screens/Chars/repository/chars_repository.dart';
part 'chars_event.dart';
part 'chars_state.dart';

class CharsBloc extends Bloc<CharsEvent, CharsState> {
  final CharsRepository _apiRepository = CharsRepository();
  int numberPage = 1;
  int totalChars = 40;

  CharsBloc() : super(CharsStateLoading()) {
    getChars() async {
      emit(CharsStateLoading());
      try {
        final ApiModel charsList =
            await _apiRepository.getCharsList(numberPage);
        totalChars = charsList.count;
        emit(CharsStateLoaded(charsList.results));
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        emit(CharsStateError(errorMessage));
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
