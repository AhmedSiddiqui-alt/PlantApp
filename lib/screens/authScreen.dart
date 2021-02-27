import 'package:flutter/material.dart';
import '../widgets/loginContainerWidget.dart';

class AuthScreen extends StatefulWidget {
  static const routeName='AuthScreen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Align(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: ClipOval(
                        child: Center(
                      child: Container(
                          child: Image.asset(
                        'assets/images/PlantLogo.png',
                        height: 200,
                      )),
                    )),
                    height: constraints.maxHeight * 0.37,
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50))),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: LoginContainer(),
                    height: constraints.maxHeight * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(150))),
                  ),
                ),
              ],
            );
          })),
    ));
  }
}
