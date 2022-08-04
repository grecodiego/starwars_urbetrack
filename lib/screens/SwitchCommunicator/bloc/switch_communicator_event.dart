part of 'switch_communicator_bloc.dart';

abstract class SwitchCommunicatorEvent {
  const SwitchCommunicatorEvent();
}

class ChangeValue extends SwitchCommunicatorEvent {}
