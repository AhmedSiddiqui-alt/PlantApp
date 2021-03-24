import 'package:PABMAS/provider/customerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cartProvider.dart';
import '../widgets/appDrawerWidget.dart';
class CartScreen extends StatefulWidget {
  static const routeName = '/cartScreen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

var init = true;
bool isLoading = true;

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    if (init) {
      final getNavigatorArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final getCustomerId = getNavigatorArguments['customerId'];
  print(getCustomerId);
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
    // final  cartData=Provider.of<CartProvider>(context).
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawerWidget(),
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
                            'Your Cart',
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
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Consumer<CartProvider>(
                        builder: (ctx, cartData, _) {
                          return Container(
                            // color: Colors.green[900],
                            height: constraints.maxHeight * 0.6,
                            child: ListView.builder(
                                itemBuilder: (ctx, index) {
                                  return Card(
                                    elevation: 4,
                                    child: ListTile(
                                      
                                      leading: Image.asset(cartData
                                          .cartItemsList.values
                                          .toList()[index]
                                          .productImage),
                                      title: Text(cartData.cartItemsList.values
                                          .toList()[index]
                                          .productName),
                                      trailing: Text(cartData
                                          .cartItemsList.values
                                          .toList()[index]
                                          .productQuantity
                                          .toString()),
                                    ),
                                  );
                                },
                                itemCount: cartData.cartItemsList.length),
                          );
                        },
                      )
              ],
            );
          }),
        ),
      ),
    );
  }
}
