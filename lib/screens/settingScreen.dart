import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/indoorProvider.dart';
import '../provider/outdoorProvider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatButton(
          onPressed: () {
            Provider.of<OutdoorPlantsProvider>(context).storeOutdoorPlantsDetails(
                'assets/images/outdoor/outdoorimg4.png',
                'Avocado',
                '4500',
                'Avocado is a tropical fruit and looks like similar to pear fruit.These fruits are a good source of nutrients compared to other fruit.');
          },
          child: Text('Click')),
    );
  }
}
