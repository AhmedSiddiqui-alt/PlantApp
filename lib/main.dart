import 'package:flutter/material.dart';
import './screens/authScreen.dart';
import './screens/plantScreen.dart';
import './screens/backGroundScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackGroundScreen(),
      routes: {
        AuthScreen.routeName: (ctx) => AuthScreen(),
        PlantScreen.routeName: (ctx) => PlantScreen()
      },
    );
  }
}
