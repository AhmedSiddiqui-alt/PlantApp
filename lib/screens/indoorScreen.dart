import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/indoorProvider.dart';
import '../provider/indoorProvider.dart';
import '../screens/indoorDetailScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../widgets/appDrawerWidget.dart';
import '../provider/customerProvider.dart';

class IndoorScreen extends StatefulWidget {
  static const routeName = 'indoorScreen';
  @override
  _IndoorScreenState createState() => _IndoorScreenState();
}

bool isLoading = true;
bool init = true;

class _IndoorScreenState extends State<IndoorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final cust =
    //     Provider.of<CustomerProvider>(context).custData.firstWhere((data) {
    //   return true;
    // });
    final indooDetailPlant =
        Provider.of<IndoorPlantsProvider>(context).indoorPlantData;
    print(indooDetailPlant.length);
    final customerId = Provider.of<CustomerProvider>(context)
        .custData
        .firstWhere((element) => true);

    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Colors.green[400],
      drawer: AppDrawerWidget(),
      body: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Container(
                  // color: Colors.blue,
                  alignment: Alignment.topRight,
                  height: constraints.maxHeight * 0.3,
                  child: Image.asset(
                      'assets/images/hangingleaf-removebg-preview.png'),
                ),
                Container(
                  height: constraints.maxHeight * 0.1,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          }),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: constraints.maxHeight * 0.05,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Indoor Plants',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.55,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 20),
                    itemBuilder: (ctx, index) {
                      return GridTile(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                IndoorDetailScreen.routeName,
                                arguments: {
                                  'indoorId': indooDetailPlant[index].id,
                                  'customerId': customerId.id
                                });
                          },
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(indooDetailPlant[index].image),
                            ),
                          ),
                        ),
                        footer: GridTileBar(
                          backgroundColor: Colors.black54,
                          title: AutoSizeText(
                            indooDetailPlant[index].name,
                            style: TextStyle(fontSize: 15),
                            maxLines: 2,
                          ),
                        ),
                      );
                    },
                    itemCount: indooDetailPlant.length,
                  ),
                )
              ],
            );
          })),
    );
  }
}
