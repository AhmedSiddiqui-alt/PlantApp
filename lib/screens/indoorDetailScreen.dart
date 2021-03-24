import 'package:PABMAS/screens/plantScreen.dart';
import 'package:flutter/material.dart';
import '../provider/indoorProvider.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../widgets/appDrawerWidget.dart';
import '../screens/indoorScreen.dart';
import '../provider/cartProvider.dart';
import '../provider/cartProvider.dart';

// import '../widgets/appDrawerWidget.dart';
class IndoorDetailScreen extends StatefulWidget {
  static const routeName = '/indoorScreen';
  @override
  _IndoorDetailScreenState createState() => _IndoorDetailScreenState();
}

var init = true;
bool isLoading = true;

class _IndoorDetailScreenState extends State<IndoorDetailScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void didChangeDependencies() {
    if (init) {
      final getNavigatorArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final getCustomerId = getNavigatorArguments['customerId'];

      Provider.of<CartProvider>(context)
          .getAllCartItems(getCustomerId)
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
    init = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final getNavigatorArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final getId = getNavigatorArguments['indoorId'];
    final getCustomerId = getNavigatorArguments['customerId'];

    final indoorPlantData = Provider.of<IndoorPlantsProvider>(context)
        .indoorPlantData
        .firstWhere((data) {
      return data.id == getId;
    });
    final getCartLength = Provider.of<CartProvider>(context).cartLength;
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
                        child: isLoading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.green[900],
                              )
                            : Text(
                                getCartLength.toString(),
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
                                    indoorPlantData.name,
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
                                    indoorPlantData.price.toString(),
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
                                    onPressed: () {
                                      Provider.of<CartProvider>(context)
                                          .AddItemsToCart(
                                              getCustomerId,
                                              indoorPlantData.id,
                                              indoorPlantData.name,
                                              indoorPlantData.price,
                                              indoorPlantData.image);
                                    },
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
                                  child: Image.asset(indoorPlantData.image),
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
                              indoorPlantData.description,
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
