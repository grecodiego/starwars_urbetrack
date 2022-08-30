import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_urbetrack/screens/Chars/bloc/chars_bloc.dart';
import 'package:starwars_urbetrack/screens/Chars/ui/pages/home_chars_screen.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/ui/screen/switch_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigation();
  }
}

class _BottomNavigation extends State<BottomNavigation> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    const HomeCharsScreen(),
    const SwitchScreen(),
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  void initState() {
    BlocProvider.of<CharsBloc>(context).add(GetCharsList());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: const Color.fromARGB(255, 0, 255, 21),
        ),
        child: BottomNavigationBar(
            unselectedItemColor: Colors.red,
            selectedItemColor: const Color.fromARGB(255, 0, 255, 21),
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.switch_access_shortcut,
                  ),
                  label: ""),
            ]),
      ),
    );
  }
}
