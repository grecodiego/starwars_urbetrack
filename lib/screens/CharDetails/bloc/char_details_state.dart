part of 'char_details_bloc.dart';

/* abstract class CharDetailsState extends Equatable {
  const CharDetailsState();

  @override
  List<Object?> get props => [];
}

class CharDetailsInitialState extends CharDetailsState {}

class CharDetailsStateLoading extends CharDetailsState {}

class CharDetailsStateLoaded extends CharDetailsState {
  final List<CharDetails>? charStarshipList;
  const CharDetailsStateLoaded(this.charStarshipList);
}

class CharDetailsStateError extends CharDetailsState {
  final String? message;
  const CharDetailsStateError(this.message);
}
 */

abstract class CharDetailsState {}

class CharDetailsInitialState extends CharDetailsState {}

class CharDetailsStateLoading extends CharDetailsState {}

class CharDetailsStateLoaded extends CharDetailsState {
  CharDetails? charDetails;
  CharDetailsStateLoaded(this.charDetails);
}

class CharDetailsStateError extends CharDetailsState {
  final String? message;
  CharDetailsStateError(String this.message) : super();
}
