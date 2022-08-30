import 'package:bloc/bloc.dart';

part 'switch_communicator_event.dart';
part 'switch_communicator_state.dart';

class SwitchCommunicatorBloc
    extends Bloc<SwitchCommunicatorEvent, SwitchCommunicatorState> {
  SwitchCommunicatorBloc()
      : super(SwitchCommunicatorState(switchValue: false)) {
    on<ChangeValue>((event, emit) {
      emit(SwitchCommunicatorState(switchValue: !state.switchValue));
    });
  }
}
