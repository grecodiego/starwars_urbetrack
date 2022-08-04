import 'package:bloc/bloc.dart';

part 'switch_bloc_event.dart';
part 'switch_bloc_state.dart';

class SwitchBlocBloc extends Bloc<SwitchBlocEvent, SwitchBlocState> {
  SwitchBlocBloc() : super(SwitchBlocInitial()) {
    on<SwitchBlocEvent>((event, emit) {});
  }
}
