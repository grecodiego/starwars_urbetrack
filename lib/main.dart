import 'package:flutter/material.dart';
import 'package:starwars_urbetrack/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'ST_ITALIC',
            primarySwatch: Colors.yellow,
            backgroundColor: Colors.black,
            primaryColorLight: Color.fromARGB(255, 0, 255, 21),
            disabledColor: Colors.red,
            unselectedWidgetColor: Colors.red),
        home: BottomNavigation());
  }
}
