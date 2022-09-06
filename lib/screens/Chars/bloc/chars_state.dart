part of 'chars_bloc.dart';

abstract class CharsState extends Equatable {
  const CharsState();

  @override
  List<Object?> get props => [];
}

class CharsStateLoading extends CharsState {}

class CharsStateLoaded extends CharsState {
  final List<Results>? results;
  const CharsStateLoaded(this.results);
}

class CharsStateError extends CharsState {
  final String? message;
  const CharsStateError(String this.message);
}
