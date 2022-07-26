part of 'chars_bloc.dart';

abstract class CharsEvent extends Equatable {
  const CharsEvent();

  @override
  List<Object> get props => [];
}

class GetCharsList extends CharsEvent {}
