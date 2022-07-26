import 'package:flutter/material.dart';
import 'package:starwars_urbetrack/screens/SwitchComunicator/ui/switch/switch_comunicator.dart';

class SwitchNavigatorScreen extends StatefulWidget {
  const SwitchNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<SwitchNavigatorScreen> createState() => _SwitchNavigatorScreen();
}

class _SwitchNavigatorScreen extends State<SwitchNavigatorScreen> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start your comunication',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.yellow,
                  fontFamily: 'ST_ITALIC_OUTBORDER',
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: SwitchComunicator(
                    switchValue: false,
                    onChanged: (bool valueIn) =>
                        {_switchValue = valueIn, setState(() {})})),
          ],
        ));
  }
}
