import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final CharRepository _charData = CharRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Star Wars',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.yellow,
                fontFamily: 'ST_ITALIC_OUTBORDER',
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Container(
          decoration: (const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("lib/assets/images/wallpaper2.jpeg")))),
          child: _buildListChars(),
        ));
  }

  Widget _buildListChars() {
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed:
                        BlocProvider.of<CharsBloc>(context).numberPage != 1
                            ? () => {
                                  BlocProvider.of<CharsBloc>(context)
                                      .add(PreviusPage()),
                                  setState(() {})
                                }
                            : null,
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color:
                              BlocProvider.of<CharsBloc>(context).numberPage !=
                                      1
                                  ? const Color.fromARGB(255, 0, 255, 21)
                                  : const Color.fromARGB(0, 0, 255, 21),
                          fontSize: 20),
                    )),
                Text(
                  'Page ${BlocProvider.of<CharsBloc>(context).numberPage}',
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'ST_ITALIC_OUTBORDER',
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: BlocProvider.of<CharsBloc>(context).numberPage <
                            BlocProvider.of<CharsBloc>(context).totalChars / 10
                        ? () => {
                              BlocProvider.of<CharsBloc>(context)
                                  .add(NextPage()),
                              setState(() {})
                            }
                        : null,
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color:
                              BlocProvider.of<CharsBloc>(context).numberPage <
                                      BlocProvider.of<CharsBloc>(context)
                                              .totalChars /
                                          10
                                  ? const Color.fromARGB(255, 0, 255, 21)
                                  : const Color.fromARGB(0, 0, 255, 21),
                          fontSize: 20),
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
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.blueAccent, width: 3)),
            child: InkWell(
              onTap: () {
                setState(() {
                  _charData.setCharData(results![index]);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CharDetailsScreen(charData: results![index])),
                );
              },
              child: Card(
                color: const Color.fromARGB(92, 0, 0, 0),
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
            ));
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
