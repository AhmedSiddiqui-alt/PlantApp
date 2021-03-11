import 'package:PABMAS/provider/indoorProvider.dart';
import 'package:PABMAS/screens/indoorScreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../screens/outdoorScreen.dart';
import 'package:provider/provider.dart';
import '../provider/customerProvider.dart';
import 'package:loading_animations/loading_animations.dart';

class PlantScreen extends StatefulWidget {
  @override
  static const routeName = '/plantScreen';
  _PlantScreenState createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  int page = 0;
  final Screens = [IndoorScreen(), OutdoorScreen()];
  @override
  bool isLoading = true;
  bool init = true;
  void didChangeDependencies() {
    if (init) {
      Provider.of<CustomerProvider>(context).getCustomerData().then((value) {
        Provider.of<IndoorPlantsProvider>(context)
            .fetchIndoorPlantsData()
            .then((value) {
          setState(() {
            isLoading = false;
          });
        });
      });
    }
    init = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: isLoading
          ? Center(
              child: LoadingBouncingGrid.circle(
              backgroundColor: Colors.green[400],
              size: 60,
              borderColor: Colors.black,
            ))
          : Screens[page],
      bottomNavigationBar: CurvedNavigationBar(
          index: page,
          backgroundColor: Colors.green[800],
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
