part of 'char_details_bloc.dart';

abstract class CharDetailsState {}

class CharDetailsStateLoading extends CharDetailsState {}

class CharDetailsStateLoaded extends CharDetailsState {
  CharDetails? charDetails;
  CharDetailsStateLoaded(this.charDetails);
}

class CharDetailsStateError extends CharDetailsState {
  final String? message;
  CharDetailsStateError(String this.message);
}
