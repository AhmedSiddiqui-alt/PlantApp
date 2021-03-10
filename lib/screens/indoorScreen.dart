import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../screens/outdoorScreen.dart';

class IndoorScreen extends StatefulWidget {
  static const routeName = 'indoorScreen';
  @override
  _IndoorScreenState createState() => _IndoorScreenState();
}


class _IndoorScreenState extends State<IndoorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        title: Text(
          'Indoor Plants',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[],
      ),
      // body: 
    
          );
    
  }
}
