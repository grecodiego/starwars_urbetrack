import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_urbetrack/bottom_navigation.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/bloc/switch_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SwitchModel(),
      child: const MyApp(),
    ),
  );
}

/* void main() {
  runApp(
    const MyApp(),
  );
} */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Star Wars Comunnicator',
        theme: ThemeData(
            fontFamily: 'ST_ITALIC',
            primarySwatch: Colors.yellow,
            backgroundColor: Colors.black,
            primaryColorLight: const Color.fromARGB(255, 0, 255, 21),
            disabledColor: Colors.red,
            unselectedWidgetColor: Colors.red),
        home: BottomNavigation());
  }
}
