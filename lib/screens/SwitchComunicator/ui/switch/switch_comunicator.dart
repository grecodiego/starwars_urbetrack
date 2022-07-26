import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SwitchComunicator extends StatefulWidget {
  SwitchComunicator({
    Key? key,
    this.switchValue = false,
    required this.onChanged,
  }) : super(key: key);
  bool switchValue;
  final ValueChanged<bool> onChanged;
  @override
  State<SwitchComunicator> createState() => _SwitchComunicatorState();
}

class _SwitchComunicatorState extends State<SwitchComunicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 220,
        height: 320,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: widget.switchValue
                  ? const Color.fromARGB(100, 0, 255, 17)
                  : const Color.fromARGB(100, 255, 0, 0),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(40),
          color: widget.switchValue
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
                      alignment: widget.switchValue
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
                                    color: widget.switchValue
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
                                  color: widget.switchValue
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
              setState(() {
                widget.switchValue = !widget.switchValue;
                widget.onChanged;
              });
            }));
  }
}
