import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monobloc/screens/home_screen.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:monobloc/widgets/detail_card.dart';
import '../tcp_client.dart';
import 'secondry_tank.dart';
import 'package:marquee/marquee.dart';

class MainTank extends StatefulWidget {
  const MainTank({Key? key}) : super(key: key);

  @override
  State<MainTank> createState() => _MainTankState();
}

class _MainTankState extends State<MainTank>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  TcpClient client = TcpClient();
  List res = [];
  bool screen1 = true;

  String max = "";
  String min = "";
  String pump1 = "";
  String pump2 = "";

  void display() async {
    if (screen1) {
      await client.main("192.168.1.50", "1314");
      setState(() {
        res = client.res.split("-");
        max = res[12];
        min = res[8];
        pump1 = res[9];
        pump2 = res[10];
      });
    }
  }

  @override
  void initState() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) async {
      display();
    });

    animationController = AnimationController(
      vsync: this,
    );

    super.initState();
  }

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
    int percentage = 20;
    return Scaffold(
      backgroundColor: const Color(0xffdfe6eb),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const HomeScreen()));
                      // screen1 = false;
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                Expanded(
                    child: SizedBox(
                  child: slideTextAnimation("Reservoir Principale"),
                  height: 30,
                )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const SecondryTank()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
            Expanded(
              flex: 4,
              child: Container(
                //color: Colors.amber,
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: LiquidLinearProgressIndicator(
                    borderRadius: 10.0,
                    borderColor: Colors.grey[200],
                    borderWidth: 1.0,
                    value: percentage / 100,
                    valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    center: Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    direction: Axis.vertical,
                    backgroundColor: Colors.white54),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  DetailCard(
                      imageUrl: "assets/images/sensor.png",
                      label: "Capteur Max",
                      color: max),
                  DetailCard(
                      imageUrl: "assets/images/sensor.png",
                      label: "Capteur Min",
                      color: min),
                  DetailCard(
                      imageUrl: "assets/images/pump.jpg",
                      label: "Pompe 1",
                      color: pump1),
                  DetailCard(
                      imageUrl: "assets/images/pump.jpg",
                      label: "Pompe 2",
                      color: pump2),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: items,
        height: 60,
        index: index,
        onTap: (index) => setState(() {
          this.index = index;
        }),
      ),
    );
  }

  Widget slideTextAnimation(String text) => Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 7),
        child: Marquee(
          text: text,
          blankSpace: 120,
          velocity: 100,
          // pauseAfterRound: const Duration(seconds: 2),
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      );
}
