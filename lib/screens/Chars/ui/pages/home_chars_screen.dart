import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_urbetrack/screens/CharDetails/bloc/char_details_bloc.dart';
import 'package:starwars_urbetrack/screens/CharDetails/repository/char_repository.dart';
import 'package:starwars_urbetrack/screens/Chars/bloc/chars_bloc.dart';
import 'package:starwars_urbetrack/screens/Chars/model/chars_model.dart';
import 'package:starwars_urbetrack/screens/CharDetails/ui/screens/char_details_screen.dart';

class HomeCharsScreen extends StatefulWidget {
  const HomeCharsScreen({Key? key}) : super(key: key);

  @override
  _HomeCharsScreen createState() => _HomeCharsScreen();
}

class _HomeCharsScreen extends State<HomeCharsScreen> {
  final CharsBloc _newChars = CharsBloc();
  final CharRepository _charData = CharRepository();
  final CharDetailsBloc _charDetail = CharDetailsBloc();
  @override
  void initState() {
    _newChars.add(GetCharsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'Star Wars',
          style: TextStyle(
              color: Colors.yellow,
              fontFamily: 'ST_ITALIC_OUTBORDER',
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: _buildListChars(),
    );
  }

  Widget _buildListChars() {
    return Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BlocProvider(
                create: (context) => _newChars,
                child: BlocListener<CharsBloc, CharsState>(
                  listener: (context, state) {
                    if (state is CharsStateError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message!),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<CharsBloc, CharsState>(
                    builder: (context, state) {
                      if (state is CharsInitialState) {
                        return _buildLoading();
                      } else if (state is CharsStateLoading) {
                        return _buildLoading();
                      } else if (state is CharsStateLoaded) {
                        return _buildCard(context, state.results);
                      } else if (state is CharsStateError) {
                        return Container();
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: _newChars.numberPage != 1
                        ? () => {
                              _newChars.sendEvent.add(previusPage()),
                              _newChars.add(GetCharsList()),
                              setState(() {})
                            }
                        : null,
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 21), fontSize: 20),
                    )),
                StreamBuilder<int>(
                  stream: _newChars.pageStream,
                  initialData: 1,
                  builder: (context, snapshot) {
                    return Text(
                      'Page ${snapshot.data}',
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontFamily: 'ST_ITALIC_OUTBORDER',
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
                TextButton(
                    onPressed: _newChars.numberPage < _newChars.totalChars / 10
                        ? () => {
                              _newChars.sendEvent.add(nextPage()),
                              _newChars.add(GetCharsList()),
                              setState(() {})
                            }
                        : null,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 21), fontSize: 20),
                    ))
              ],
            )
          ],
        ));
  }

  Widget _buildCard(BuildContext context, List<Results>? results) {
    return ListView.builder(
      itemCount: results?.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.blueAccent, width: 3)),
            child: InkWell(
              onTap: () {
                setState(() {
                  _charData.setCharData(results![index]);
                  //      _charDetail.add(GetCharDetails());
                  //  setState(() {});
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CharDetailsScreen(charData: results![index])),
                );
              },
              child: Card(
                color: Colors.black,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Name: ${results?[index].name}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'ST_ITALIC',
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Gender: ${results?[index].gender}",
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontFamily: 'ST_ITALIC',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
