import 'package:flutter/material.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/bloc/switch_notifier.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/ui/switch/switch_widget.dart';

import 'package:provider/provider.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreen();
}

class _SwitchScreen extends State<SwitchScreen> {
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
                child: SwitchWidget(
                    switchValue: Provider.of<SwitchModel>(context).switchValue,
                    onChanged: Provider.of<SwitchModel>(context, listen: false)
                        .changeValue))
          ],
        ));
  }
}
