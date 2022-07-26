part of 'char_details_bloc.dart';

abstract class CharDetailsState extends Equatable {
  const CharDetailsState();

  @override
  List<Object?> get props => [];
}

class CharDetailsInitialState extends CharDetailsState {}

class CharDetailsStateLoading extends CharDetailsState {}

class CharDetailsStateLoaded extends CharDetailsState {
  final List<StarshipModel>? charStarshipList;
  const CharDetailsStateLoaded(this.charStarshipList);
}

class CharDetailsStateError extends CharDetailsState {
  final String? message;
  const CharDetailsStateError(this.message);
}
