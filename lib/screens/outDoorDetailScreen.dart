import 'package:flutter/material.dart';
import '../provider/outdoorProvider.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../widgets/appDrawerWidget.dart';
import '../screens/outdoorScreen.dart';
import '../screens/plantScreen.dart';
class OutDoorDetailScreen extends StatefulWidget {
  @override
  _OutDoorDetailScreenState createState() => _OutDoorDetailScreenState();
  static const routeName = '/outDoorScreen';
}

class _OutDoorDetailScreenState extends State<OutDoorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final getId = ModalRoute.of(context).settings.arguments as String;
    final outdoorPlantData = Provider.of<OutdoorPlantsProvider>(context)
        .outoorPlantData
        .firstWhere((data) {
      return data.id == getId;
    });
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: LayoutBuilder(builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                height: constraints.maxHeight * 0.3,
                child: Image.asset(
                    'assets/images/hangingleaf-removebg-preview.png'),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.green[900],
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(PlantScreen.routeName);
                    }),
                Stack(
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight * 0.1,
                      child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart_sharp,
                            size: 40,
                          ),
                          onPressed: () {},
                          color: Colors.green[900]),
                    ),
                    Positioned(
                      // left: 2,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.green[900],
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: constraints.maxHeight * 0.13),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Container(
                                  // margin: EdgeInsets.only(top: 20),
                                  // color: Colors.blue,
                                  child: AutoSizeText(
                                    'Indoor',
                                    style: TextStyle(
                                        color: Colors.grey[300], fontSize: 14),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Container(
                                  height: constraints.maxHeight * 0.1,
                                  width: constraints.maxWidth * 0.6,
                                  // color: Colors.blue,
                                  child: AutoSizeText(
                                    outdoorPlantData.name,
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Container(
                                  // margin: EdgeInsets.only(top: 20),
                                  // color: Colors.blue2
                                  child: AutoSizeText(
                                    'From',
                                    style: TextStyle(
                                        color: Colors.grey[300], fontSize: 14),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Container(
                                  height: constraints.maxHeight * 0.05,
                                  width: constraints.maxWidth * 0.5,
                                  // color: Colors.blue,
                                  child: AutoSizeText(
                                    outdoorPlantData.price.toString(),
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25)),
                                height: constraints.maxHeight * 0.08,
                                child: IconButton(
                                    alignment: Alignment.center,
                                    icon: Icon(
                                      Icons.add_shopping_cart,
                                      size: 40,
                                    ),
                                    onPressed: () {},
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: FractionalOffset.centerRight,
                                child: Container(
                                  // color: Colors.blue,
                                  height: constraints.maxHeight * 0.2,
                                  child: Image.asset(outdoorPlantData.image),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        // height: 0.1,
                        child: Text(
                          'Description',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        // color: Colors.blue,
                        height: constraints.maxHeight * 0.15,
                        child: ListView(
                          children: [
                            AutoSizeText(
                              outdoorPlantData.description,
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  height: constraints.maxHeight * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: Colors.green[900]),
                ),
              ),
            ],
          );
        }),
      ),
    ));
  }
}
