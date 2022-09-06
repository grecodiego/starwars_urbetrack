part of 'chars_bloc.dart';

abstract class CharsEvent {
  const CharsEvent();
}

class GetCharsList extends CharsEvent {}

class NextPage extends CharsEvent {}

class PreviusPage extends CharsEvent {}
