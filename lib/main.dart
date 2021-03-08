import 'package:flutter/material.dart';
import './screens/authScreen.dart';
import './screens/plantScreen.dart';
import './screens/backGroundScreen.dart';
import './screens/registrationScreen.dart';
import 'package:provider/provider.dart';
import './provider/customerProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: CustomerProvider())],
      child: MaterialApp(
        home: BackGroundScreen(),
        routes: {
          AuthScreen.routeName: (ctx) => AuthScreen(),
          PlantScreen.routeName: (ctx) => PlantScreen(),
          RegistrationScreen.routeName: (ctx) => RegistrationScreen()
        },
      ),
    );
  }
}
