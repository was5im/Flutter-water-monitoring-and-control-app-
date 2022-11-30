import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingCounterCard extends StatefulWidget {
  // final String imageUrl;
  final String label;
  int minuts = 0;
  int hours = 0;
  SettingCounterCard(
      {required this.label});

  @override
  State<SettingCounterCard> createState() => _SettingCounterCardState();
}

class _SettingCounterCardState extends State<SettingCounterCard> {
  
  late bool value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 30,
          vertical: MediaQuery.of(context).size.height / 100),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 3.0,
                  offset: const Offset(0, 3),
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-3, 0),
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(3, 0),
                )
              ],
              color: Colors.white),
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (widget.hours == 23) {
                                setState(() {
                                  widget.hours = 0;
                                });
                              } else {
                                setState(() {
                                  widget.hours += 1;
                                });
                              }
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.width * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "+",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            alignment: Alignment.center,
                            child:
                                Text(widget.hours.toString().padLeft(2, '0')),
                          ),
                          InkWell(
                            onTap: () {
                              if (widget.hours == 0) {
                                setState(() {
                                  widget.hours = 23;
                                });
                              } else {
                                setState(() {
                                  widget.hours -= 1;
                                });
                              }
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.width * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "-",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (widget.minuts == 59) {
                                setState(() {
                                  widget.minuts = 0;
                                });
                              } else {
                                setState(() {
                                  widget.minuts += 1;
                                });
                              }
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.width * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "+",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.035,
                            width: MediaQuery.of(context).size.width * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            alignment: Alignment.center,
                            child:
                                Text(widget.minuts.toString().padLeft(2, '0')),
                          ),
                          InkWell(
                            onTap: () {
                              if (widget.minuts == 0) {
                                setState(() {
                                  widget.minuts = 59;
                                });
                              } else {
                                setState(() {
                                  widget.minuts -= 1;
                                });
                              }
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.width * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "-",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
