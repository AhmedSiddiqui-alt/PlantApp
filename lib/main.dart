import 'package:PABMAS/provider/authProvider.dart';
import 'package:PABMAS/provider/indoorProvider.dart';
import 'package:PABMAS/screens/plantScreen.dart';
import 'package:flutter/material.dart';
import './screens/authScreen.dart';
import 'screens/indoorScreen.dart';
import './screens/backGroundScreen.dart';
import './screens/registrationScreen.dart';
import 'package:provider/provider.dart';
import './provider/customerProvider.dart';
// import 'package:device_preview/device_preview.dart';

void main() {
  runApp(MyApp());
}
// void main() {
//   runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProxyProvider<AuthProvider, CustomerProvider>(
          create: null,
          update: null,
          builder: (ctx, authData, previousData) {
            return CustomerProvider(emailCust: authData.emailCust);
          },
        ),
        ChangeNotifierProvider.value(value: IndoorPlantsProvider())
      ],
      child: Consumer<AuthProvider>(builder: (ctx, authProvider, _) {
        print(authProvider.checkEmail);
        return MaterialApp(
          // home: PlantScreen(),

          home: authProvider.checkEmail ? PlantScreen() : BackGroundScreen(),
          routes: {
            PlantScreen.routeName: (ctx) => PlantScreen(),
            BackGroundScreen.routeName: (ctx) => BackGroundScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            RegistrationScreen.routeName: (ctx) => RegistrationScreen()
          },
        );
      }),
    );
  }
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value(value: AuthProvider()),
//         ChangeNotifierProvider.value(value: CustomerProvider())
//       ],
//       child: Consumer<AuthProvider>(builder: (ctx, authProvider, _) {
//         print(authProvider.checkEmail);
//         return MaterialApp(
//           locale: DevicePreview.locale(context),
//           builder: DevicePreview.appBuilder,
//           home: authProvider.checkEmail ? PlantScreen() : BackGroundScreen(),
//           routes: {
//             AuthScreen.routeName: (ctx) => AuthScreen(),
//             PlantScreen.routeName: (ctx) => PlantScreen(),
//             RegistrationScreen.routeName: (ctx) => RegistrationScreen()
//           },
//         );
//       }),
//     );
//   }
// }
