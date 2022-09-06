part of 'char_details_bloc.dart';

abstract class CharDetailsEvent {
  const CharDetailsEvent();
}

class GetCharDetails extends CharDetailsEvent {
  Results charData;
  GetCharDetails(this.charData);
}
