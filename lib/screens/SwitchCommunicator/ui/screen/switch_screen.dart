import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/bloc/switch_communicator_bloc.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/ui/switch/switch_widget.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({Key? key}) : super(key: key);

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
            Center(child:
                BlocBuilder<SwitchCommunicatorBloc, SwitchCommunicatorState>(
              builder: (context, state) {
                return SwitchWidget(
                    switchValue: state.switchValue,
                    onChanged: () => {
                          BlocProvider.of<SwitchCommunicatorBloc>(context)
                              .add(ChangeValue()),
                        });
              },
            ))
          ],
        ));
  }
}
