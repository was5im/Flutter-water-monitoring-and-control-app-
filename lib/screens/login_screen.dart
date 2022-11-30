import 'package:flutter/material.dart';
import 'package:monobloc/screens/home_screen.dart';
import 'package:monobloc/widgets/ip_address_text_field.dart';
import 'package:monobloc/widgets/port_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: const Color(0xff79DAE8),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: const Color(0xFFEEEEEE),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.001,
            //right: MediaQuery.of(context).size.width * 0.1,
            child: Image.asset("assets/images/login_image.png",
                height: MediaQuery.of(context).size.height * 0.4),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20,
            bottom: MediaQuery.of(context).size.height / 6,
            top: MediaQuery.of(context).size.height / 2.3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10,
            bottom: MediaQuery.of(context).size.height / 10,
            child: Image.asset(
              "assets/images/login_button.png",
              height: MediaQuery.of(context).size.height / 7,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10,
            bottom: MediaQuery.of(context).size.height / 6.5,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 10,
              right: MediaQuery.of(context).size.width / 10,
              bottom: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      IpAddressTextField(
                        last: false,
                        index: "ipv41",
                      ),
                      IpAddressTextField(
                        last: false,
                        index: "ipv42",
                      ),
                      IpAddressTextField(
                        last: false,
                        index: "ipv43",
                      ),
                      IpAddressTextField(
                        last: true,
                        index: "ipv44",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      PortTextField(
                        last: false,
                        index: "port1",
                      ),
                      PortTextField(
                        last: false,
                        index: "ipv42",
                      ),
                      PortTextField(
                        last: false,
                        index: "ipv43",
                      ),
                      PortTextField(
                        last: true,
                        index: "ipv44",
                      ),
                    ],
                  ),
                ],
              )),
          Positioned(
              left: MediaQuery.of(context).size.width / 6.5,
              bottom: MediaQuery.of(context).size.height / 2.3,
              child: Text(
                "Adresse IP",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              )),
          Positioned(
              left: MediaQuery.of(context).size.width / 6.5,
              bottom: MediaQuery.of(context).size.height / 3.3,
              child: Text(
                "Port",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              )),
        ],
      ),
    );
  }
}
