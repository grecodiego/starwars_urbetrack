part of 'char_details_bloc.dart';

abstract class CharDetailsEvent extends Equatable {
  const CharDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetCharDetails extends CharDetailsEvent {}
