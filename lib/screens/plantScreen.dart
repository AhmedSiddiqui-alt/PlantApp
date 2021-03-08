import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class PlantScreen extends StatefulWidget {
  static const routeName = 'PlantScreen';
  @override
  _PlantScreenState createState() => _PlantScreenState();
}

int page = 0;

class _PlantScreenState extends State<PlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   actions: <Widget>[
      //   IconBu
      //   ],
      // ),
      body: SingleChildScrollView(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.green[200],
        items: [
          Text('Top'),
          Text('Outdoor'),
          Text('Indoor'),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
    );
  }
}
