import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:monobloc/widgets/tank_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // ignore: non_constant_identifier_names
  final List<String> tanks_label = [
    "1",
    "2",
    "3",
    "4",
  ];

  final List<String> statues = [
    "Master",
    "Master",
    "Master",
    "Master",
  ];

  final List<String> address = [
    "192.168.1.50",
    "192.168.1.51",
    "192.168.1.52",
    "192.168.1.53",
  ];

  final List<String> states = [
    "ON",
    "OFF",
    "ON",
    "ON",
  ];

  final items = <Widget>[
    const Icon(Icons.home, size: 30),
    const Icon(Icons.search, size: 30),
    const Icon(Icons.add, size: 30),
    const Icon(Icons.settings, size: 30),
    const Icon(Icons.person, size: 30),
  ];

  int index = 2;
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xffdfe6eb),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff7e57ff), Color(0xff4497fc)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.menu),
                              color: Colors.white,
                              iconSize: 30,
                            ),
                            const Text(
                              "Stations",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_horiz_outlined),
                              color: Colors.white,
                              iconSize: 30,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: const [
                          Text(
                            "4",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Stations actives",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                    itemCount: tanks_label.length,
                    itemBuilder: (context, index) {
                      return TankCard(
                        label: tanks_label[index],
                        index: index,
                        statue: statues[index],
                        ipAddress: address[index],
                        state: states[index],
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          items: items,
          height: 60,
          index: index,
          onTap: (index) => setState(() {
            this.index = index;
          }),
        ));
  }
}

