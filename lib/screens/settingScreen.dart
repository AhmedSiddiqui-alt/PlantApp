import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/indoorProvider.dart';

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
            Provider.of<IndoorPlantsProvider>(context).updateIndoorPlantsDetails(
                'assets/images/indoor/indimg4.png',
                'Syngonium wendlandi',
                '16500',
                'Syngonium is a great looking, elegant, and versatile houseplant which needs only modest care. Its foliage attractive color will add up the beauty in your house and have the ability to cleanse the air you breathe.');
          },
          child: Text('Click')),
    );
  }
}
