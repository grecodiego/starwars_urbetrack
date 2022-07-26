import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';

class CharRepository {
  late Results charData;

  static final CharRepository _instance = CharRepository._internal();

  CharRepository._internal();

  factory CharRepository() {
    return _instance;
  }

  void setCharData(charDataIn) {
    charData = charDataIn;
  }

  Results get() {
    return charData;
  }
}

class NetworkError extends Error {}
