import './authScreen.dart';
import 'package:flutter/material.dart';
import '../screens/registrationScreen.dart';

class BackGroundScreen extends StatefulWidget {
  @override
  _BackGroundScreenState createState() => _BackGroundScreenState();
}

class _BackGroundScreenState extends State<BackGroundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: (MediaQuery.of(context).size.height) * 1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/leaf.jpg'),
                fit: BoxFit.cover)),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: constraints.maxHeight * 0.8,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                          height: constraints.maxHeight * 0.25,
                          child: ClipOval(
                              child:
                                  Image.asset('assets/images/gardening.png'))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: constraints.maxHeight * 0.1,
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            'Plant a ',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.1,
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            'tree,',
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                color: Colors.green[200]),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: constraints.maxHeight * 0.1,
                          // margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'green',
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                color: Colors.green[200]),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.1,
                          // margin: EdgeInsets.only(top: 10),
                          child: Text(
                            ' the earth',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: constraints.maxHeight * 0.08,
                      width: constraints.maxHeight * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(30)),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AuthScreen.routeName);
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: constraints.maxHeight * 0.08,
                      width: constraints.maxHeight * 0.3,
                      decoration: BoxDecoration(
                          // color: Colors.green[400],
                          borderRadius: BorderRadius.circular(30)),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RegistrationScreen.routeName);
                          },
                          child: Text(
                            'Create an Account',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
