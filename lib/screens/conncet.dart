import 'dart:ui';

import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: Image.asset("assets/images/lock.PNG"),
            ),
            Text(
              "Bienvenu à nouveau",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Veuillez entrer vos cordonées",
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                    width: double.infinity,
                    child: TextField(
                      controller: _controller1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Nom d'utilisateur"),
                    ),
                  ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                    width: double.infinity,
                    child: TextField(
                      obscureText: true,
                      controller: _controller1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Mot de passe"),
                    ),
                  ),
            ),
            SizedBox(height: 20,),
            MaterialButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.345,
                      vertical: 20),
                  color: Color.fromRGBO(102, 134, 228, 1),
                  onPressed: (){},
                  child: Text(
                    "Se Connecter",
                    style: TextStyle(color: Colors.white),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
