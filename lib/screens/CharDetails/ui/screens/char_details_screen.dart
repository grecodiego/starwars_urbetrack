import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_bloc.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/char_details_repositories.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'package:starwars_urbetrack/screens/SwitchCommunicator/bloc/switch_communicator_bloc.dart';

class CharDetailsScreen extends StatefulWidget {
  final Results charData;

  const CharDetailsScreen({Key? key, required this.charData}) : super(key: key);

  @override
  State<CharDetailsScreen> createState() => _CharDetailsScreenState();
}

class _CharDetailsScreenState extends State<CharDetailsScreen> {
  final DetailsApiRepository characterDetailsRepository =
      DetailsApiRepository();
  final ReportRepository reportRepository = ReportRepository();

  void initialState() {
    super.initState();
  }

  void activeSnackbar(responseReport) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      'Response: ${responseReport.statusCode}. Successful report, remember to turn off the connection so as not to be detected by the enemy!!!!',
      style: const TextStyle(
          color: Colors.yellow,
          fontFamily: 'ST_ITALIC_OUTBORDER',
          fontSize: 16,
          fontWeight: FontWeight.bold),
    )));
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharDetailsBloc>(context)
        .add(GetCharDetails(widget.charData));
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text(
            'DETAILS',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.yellow,
                fontFamily: 'ST_ITALIC_OUTBORDER',
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _informationText('Name', widget.charData.name),
                  _informationText('Gender', widget.charData.gender),
                  _informationText('Birthyear', widget.charData.birthYear),
                  _informationText('Eyes color', widget.charData.eyeColor),
                  _informationText('Hair color', widget.charData.hairColor),
                  _informationText('Height', widget.charData.height),
                  _informationText('Weight', widget.charData.mass),
                  BlocBuilder<CharDetailsBloc, CharDetailsState>(
                      builder: (context, state) {
                    if (state is CharDetailsInitialState) {
                      return _buildLoading();
                    } else if (state is CharDetailsStateLoading) {
                      return _buildLoading();
                    } else if (state is CharDetailsStateLoaded) {
                      return Column(
                        children: [
                          _informationText(
                              'Birthworld', state.charDetails?.charWorldName),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.charDetails?.charVehicles.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _informationText(
                                    'Vehicle N${index + 1}',
                                    state
                                        .charDetails?.charVehicles[index].name);
                              }),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  state.charDetails?.charStarships.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _informationText(
                                    'Starship N${index + 1}',
                                    state.charDetails?.charStarships[index]
                                        .name);
                              }),
                        ],
                      );
                    } else if (state is CharDetailsStateError) {
                      return Container();
                    } else {
                      return Container();
                    }
                  })
                ]),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<SwitchCommunicatorBloc, SwitchCommunicatorState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        state.switchValue == true
                            ? const SizedBox(height: 20)
                            : const Text(
                                'Please switch ON the communicator before reporting!',
                                style: TextStyle(color: Colors.red),
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: state.switchValue == true
                              ? () async {
                                  var responseReport = await reportRepository
                                      .sendReport(widget.charData.name);
                                  activeSnackbar(responseReport);
                                }
                              : () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    'Please switch ON the communicator before reporting!',
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontFamily: 'ST_ITALIC_OUTBORDER',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )));
                                },
                          child: const Text('REPORT INVADER'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Go back'),
                        ),
                      ],
                    );
                  },
                ),
              ],
            )));
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());

Widget _informationText(title, data) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Row(children: [
      Text(
        '$title: ',
        style: const TextStyle(
            color: Colors.yellow,
            fontFamily: 'LATO',
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      Text(
        '$data',
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'LATO',
            fontSize: 18,
            fontWeight: FontWeight.bold),
      )
    ]),
  );
}
