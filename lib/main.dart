import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_urbetrack/bottom_navigation.dart';
import 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_bloc.dart';
import 'package:starwars_urbetrack/screens/Chars/bloc/chars_bloc.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/bloc/switch_communicator_bloc.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharsBloc(),
          ),
          BlocProvider(
            create: (context) => SwitchCommunicatorBloc(),
          ),
          BlocProvider(
            create: (context) => CharDetailsBloc(),
          )
        ],
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
