import 'package:PABMAS/provider/indoorProvider.dart';
import 'package:PABMAS/screens/indoorScreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../screens/outdoorScreen.dart';
import 'package:provider/provider.dart';
import '../provider/customerProvider.dart';
import 'package:loading_animations/loading_animations.dart';
import '../provider/outdoorProvider.dart';
import 'package:weather_icons/weather_icons.dart';

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
        if (Provider.of<CustomerProvider>(context).emailCust != null) {
          print('Idhr Hun Mein 0');
          print(Provider.of<CustomerProvider>(context).emailCust.toString() +
              'LOL');
          print(Provider.of<OutdoorPlantsProvider>(context)
              .outoorPlantData
              .toString());
          print(Provider.of<IndoorPlantsProvider>(context)
              .indoorPlantData
              .toString());

          if (Provider.of<IndoorPlantsProvider>(context)
                  .indoorPlantData
                  .isEmpty ||
              Provider.of<OutdoorPlantsProvider>(context)
                  .outoorPlantData
                  .isEmpty) {
            Provider.of<IndoorPlantsProvider>(context)
                .fetchIndoorPlantsData()
                .then((value) {
              Provider.of<OutdoorPlantsProvider>(context)
                  .fetchOutdoorPlantsData()
                  .then((value) {
                setState(() {
                  isLoading = false;
                });
              });
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        } else {
          print('Idhr Hun Mein 1');
          Navigator.of(context).pop();
        }
      });
      // Provider.of<IndoorPlantsProvider>(context)
      //     .fetchIndoorPlantsData()
      //     .then((value) {
      //   setState(() {
      //     isLoading = false;
      //   });
      // });
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
              child: Icon(Icons.home),
            ),
            GestureDetector(
              child: Icon(WeatherIcons.day_cloudy_high),
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
