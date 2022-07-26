import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  SwitchWidget({
    Key? key,
    required this.switchValue,
    required this.onChanged,
  }) : super(key: key);
  bool switchValue;
  Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 220,
        height: 320,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: switchValue
                  ? const Color.fromARGB(100, 0, 255, 17)
                  : const Color.fromARGB(100, 255, 0, 0),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(40),
          color: switchValue
              ? const Color.fromARGB(255, 0, 255, 17)
              : const Color.fromARGB(255, 255, 0, 0),
        ),
        child: InkWell(
            splashColor: const Color.fromARGB(255, 19, 19, 19),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.00),
                    color: const Color.fromARGB(255, 110, 110, 110)),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        color: Colors.black,
                        height: 180,
                        width: 20,
                      ),
                    ),
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: switchValue
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: switchValue
                                        ? const Color.fromARGB(255, 0, 255, 17)
                                        : const Color.fromARGB(255, 255, 0, 0),
                                    spreadRadius: 2,
                                    blurRadius: 20,
                                    offset: const Offset(0, 0),
                                  )
                                ],
                                color: const Color.fromARGB(255, 19, 19, 19),
                                borderRadius: BorderRadius.circular(20.00)),
                            child: Center(
                                child: Text(
                              'LINK',
                              style: TextStyle(
                                  fontFamily: 'ST_ITALIC',
                                  color: switchValue
                                      ? const Color.fromARGB(255, 0, 255, 17)
                                      : const Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 38,
                                  fontWeight: FontWeight.w100),
                            ))),
                      ),
                    ),
                  ],
                )),
            onTap: () {
              onChanged();
            }));
  }
}
