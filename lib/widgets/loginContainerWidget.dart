import 'package:flutter/material.dart';

class LoginContainer extends StatefulWidget {
  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: ClipOval(
                      child: Container(
                          height: constraints.maxHeight * 0.2,
                          child: Image.asset(
                            'assets/images/LoginLogo.png',
                            height: 120,
                          ))),
                ),
                Form(
                    child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5,bottom: 5),
                      height: constraints.maxHeight * 0.1,
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'NIC',
                            suffixIcon: Icon(
                              Icons.flag,
                              color: Colors.green[200],
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5,bottom: 5),
                      height: constraints.maxHeight * 0.1,
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Cell Number',
                            suffixIcon: Icon(
                              Icons.call,
                              color: Colors.green[200],
                            )),
                      ),
                    ),
                    Container(
                        height: constraints.maxHeight * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.green[200],
                            borderRadius: BorderRadius.circular(25)),
                        child:
                            FlatButton(onPressed: () {}, child: Text('Login')))
                  ],
                ))
              ],
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
            height: constraints.maxHeight * 0.6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
        ],
      );
    });
  }
}
