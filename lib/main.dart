import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:starwars_urbetrack/bottom_navigation.dart';
import 'package:starwars_urbetrack/screens/Chars/bloc/chars_bloc.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/bloc/switch_bloc.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SwitchModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final CharsBloc _newChars = CharsBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _newChars,
        child: MaterialApp(
            title: 'Star Wars Comunnicator',
            theme: ThemeData(
                fontFamily: 'ST_ITALIC',
                primarySwatch: Colors.yellow,
                backgroundColor: Colors.black,
                primaryColorLight: const Color.fromARGB(255, 0, 255, 21),
                disabledColor: Colors.red,
                unselectedWidgetColor: Colors.red),
            home: BottomNavigation()));
  }
}
