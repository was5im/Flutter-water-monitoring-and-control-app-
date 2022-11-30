import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monobloc/screens/conncet.dart';
import 'package:monobloc/screens/splash_screen.dart';



void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



