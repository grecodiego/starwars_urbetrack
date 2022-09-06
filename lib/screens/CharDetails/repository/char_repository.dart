import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';

class CharRepository {
  late Results charData;

  void setCharData(charDataIn) {
    charData = charDataIn;
  }

  Results get() {
    return charData;
  }
}
