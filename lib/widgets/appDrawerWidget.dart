import 'package:flutter/material.dart';
import '../provider/authProvider.dart';
import '../provider/customerProvider.dart';
import 'package:provider/provider.dart';

class AppDrawerWidget extends StatefulWidget {
  @override
  _AppDrawerWidgetState createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.green[900],
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(85)),
              height: MediaQuery.of(context).size.height * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/user.png'),
              ),
            ),
            ListTile(
              leading: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.logout),
                  color: Colors.white,
                  onPressed: () {
                    Provider.of<AuthProvider>(context).logoutCustomer();
                    Provider.of<CustomerProvider>(context).logoutCust();
                    Navigator.of(context).pushReplacementNamed('/');
                  }),
            ),
            ListTile(
              leading: Text(
                'Cart',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.shopping_cart_rounded),
                  color: Colors.white,
                  onPressed: () {}),
            ),
            ListTile(
              leading: Text(
                'Orders',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.money),
                  color: Colors.white,
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
