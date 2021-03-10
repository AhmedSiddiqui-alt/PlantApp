import 'package:PABMAS/screens/indoorScreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../screens/outdoorScreen.dart';

class PlantScreen extends StatefulWidget {
  @override
  static const routeName = '/plantScreen';
  _PlantScreenState createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  int page = 0;
  final Screens = [IndoorScreen(), OutdoorScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Screens[page],
      bottomNavigationBar: CurvedNavigationBar(
          index: page,
          backgroundColor: Colors.green[400],
          items: [
            GestureDetector(
              child: Text('Indoor'),
            ),
            GestureDetector(
              child: Text('Outdoor'),
            ),
          ],
          onTap: (index) {
            setState(() {
              page = index;
            });
          }),
    );
  }
}
