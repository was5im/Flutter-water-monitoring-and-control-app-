import 'package:flutter/material.dart';
import 'package:monobloc/screens/main_tank.dart';
import 'package:monobloc/widgets/setting_card.dart';
import 'package:monobloc/widgets/setting_counter_card.dart';

import '../tcp_client.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  TcpClient client = TcpClient();
  int minuts1 = 0;
  int minuts2 = 0;
  int hours1 = 0;
  int hours2 = 0;
  int switch_1_value = 0;
  int switch_2_value = 0;
  int aeration_time = 0;
  int settling_time = 0;
  String frame = "";
  bool screen3 = true;

  void setSettings() async {
    if (screen3) {
      aeration_time = minuts1 + hours1;
      settling_time = minuts2 + hours2;
      frame = switch_1_value.toString()+switch_2_value.toString()+aeration_time.toString().padLeft(4, '0')+settling_time.toString().padLeft(4, '0');
      await client.setData("192.168.1.50", "1314" , frame);
    }
  }
  @override
  Widget build(BuildContext context) {
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
                          builder: (_) => const MainTank()));
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(
                  "Paramètres",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                IconButton(
                    onPressed: () {
                      setSettings();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const Setting()));
                    },
                    icon: const Icon(Icons.save)),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                child: ListView(
                  children: [
                    SettingCard(
                        // imageUrl: "assets/images/sensor.png",
                        label: "Première pompe",
                        ),
                    SettingCard(
                        // imageUrl: "assets/images/sensor.png",
                        label: "Deuxième pompe",
                        ),
                    SettingCard(
                        // imageUrl: "assets/images/sensor.png",
                        label: "Vanne",
                        ),
                    SettingCard(
                        // imageUrl: "assets/images/sensor.png",
                        label: "Premier aérateur",
                        ),   
                    SettingCard(
                        // imageUrl: "assets/images/sensor.png",
                        label: "Deuxième aérateur",
                        ),  
                    SettingCard(
                        // imageUrl: "assets/images/sensor.png",
                        label: "pompe d'évacuation 1",
                        ),  
                    SettingCard(
                        // imageUrl: "assets/images/sensor.png",
                        label: "pompe d'évacuation 2",
                        ),              
                    SettingCounterCard(label: "Temps d'aeration"),
                    SettingCounterCard(label: "Temps de décantation"),
                    SettingCounterCard(label: "Temps de repos"),

                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
