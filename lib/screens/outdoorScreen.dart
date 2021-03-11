import 'package:flutter/material.dart';


class OutdoorScreen extends StatefulWidget {
  static const routeName = '/outdoorScreen';

  @override
  _OutdoorScreenState createState() => _OutdoorScreenState();
}

class _OutdoorScreenState extends State<OutdoorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        title: Text(
          'Outdoor Plants',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(),
    );
  }
}
