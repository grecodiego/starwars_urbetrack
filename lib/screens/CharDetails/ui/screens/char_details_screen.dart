import 'package:flutter/material.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/api_repository.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';

class CharDetailsScreen extends StatefulWidget {
  Results charData;

  CharDetailsScreen({Key? key, required this.charData}) : super(key: key);

  @override
  State<CharDetailsScreen> createState() => _CharDetailsScreenState();
}

class _CharDetailsScreenState extends State<CharDetailsScreen> {
  final DetailsApiRepository characterDetailsRepository =
      DetailsApiRepository();

  void initialState() {
    //_charDetails.add(GetCharDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text(
            'DETAILS',
            style: TextStyle(
                color: Colors.yellow,
                fontFamily: 'ST_ITALIC_OUTBORDER',
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: ListView(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _InformationText('Name', widget.charData.name),
              _InformationText('Gender', widget.charData.gender),
              _InformationText('Birthyear', widget.charData.birthYear),
              _InformationText('Eyes color', widget.charData.eyeColor),
              _InformationText('Hair color', widget.charData.hairColor),
              _InformationText('Height', widget.charData.height),
              _InformationText('Weight', widget.charData.mass),
              //  _InformationText('Vehicles', widget.charData.vehicles),
              FutureBuilder(
                future:
                    characterDetailsRepository.GetCharWorld(widget.charData),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return _InformationText('Birthworld', snapshot.data.name);
                  } else {
                    return _buildLoading();
                  }
                },
              ),
              FutureBuilder(
                future: characterDetailsRepository
                    .getCharStarship(widget.charData.starships),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _InformationText('Starship N${index + 1}',
                              snapshot.data[index].name);
                        });
                  } else {
                    return _buildLoading();
                  }
                },
              ),
              FutureBuilder(
                future: characterDetailsRepository
                    .getCharVehicle(widget.charData.vehicles),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _InformationText('Vehicle N${index + 1}',
                              snapshot.data[index].name);
                        });
                  } else {
                    return _buildLoading();
                  }
                },
              ),
            ]),
            RaisedButton(
              color: Colors.yellow,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        )));
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
Widget _InformationText(title, data) {
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
