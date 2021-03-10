import 'package:flutter/material.dart';
import 'indoorScreen.dart';
import '../models/auth.dart';
import 'package:provider/provider.dart';
import '../provider/authProvider.dart';
import 'package:loading_animations/loading_animations.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = 'AuthScreen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var authData = Auth(key: null, authEmail: null, authPassword: null);
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void saveForm() async {
    _formKey.currentState.save();
    try {
      if (_formKey.currentState.validate()) {
        await Provider.of<AuthProvider>(context)
            .loginCustomer(authData.authEmail, authData.authPassword);
        Navigator.of(context).pop();
      }
    } catch (error) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(error.toString()),
              actions: <Widget>[
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(25)),
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.of(context).pop(false);
                          // Navigator.of(context).pop();
                        },
                        child: Text('Okay')))
              ],
            );
          });
    } finally {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: LoadingBouncingGrid.circle(
                backgroundColor: Colors.green[400],
                size: 60,
                borderColor: Colors.black,
              ))
            : SingleChildScrollView(
                child: Container(
                    height: (MediaQuery.of(context).size.height) * 1,
                    child: LayoutBuilder(builder: (ctx, constraints) {
                      return Column(
                        children: <Widget>[
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(bottom: constraints.maxHeight * 0.05),
                              child: ClipOval(
                                  child: Center(
                                child: Container(
                                    child: Image.asset(
                                  'assets/images/PlantLogo.png',
                                  height: 200,
                                )),
                              )),
                              height: constraints.maxHeight * 0.35,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Center(
                                          child: ClipOval(
                                              child: Container(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.1,
                                                  child: Image.asset(
                                                    'assets/images/LoginLogo.png',
                                                    height: 120,
                                                  ))),
                                        ),
                                        Form(
                                            key: _formKey,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      bottom: 5),
                                                  height:
                                                      constraints.maxHeight *
                                                          0.05,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Email is not enter';
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    onSaved: (email) {
                                                      authData = Auth(
                                                          key: authData.key,
                                                          authEmail: email,
                                                          authPassword: authData
                                                              .authPassword);
                                                    },
                                                    decoration: InputDecoration(
                                                        hintText: 'Email',
                                                        suffixIcon: Icon(
                                                          Icons.mail,
                                                          color:
                                                              Colors.green[400],
                                                        )),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      bottom: 5),
                                                  height:
                                                      constraints.maxHeight *
                                                          0.05,
                                                  child: TextFormField(
                                                    onSaved: (password) {
                                                      authData = Auth(
                                                          key: authData.key,
                                                          authEmail: authData
                                                              .authEmail,
                                                          authPassword:
                                                              password);
                                                    },
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Password is not enter';
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                        hintText: 'Password',
                                                        suffixIcon: Icon(
                                                          Icons.lock,
                                                          color:
                                                              Colors.green[400],
                                                        )),
                                                  ),
                                                ),
                                                Container(
                                                    height:
                                                        constraints.maxHeight *
                                                            0.07,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.green[400],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: FlatButton(
                                                        onPressed: () {
                                                          // Navigator.of(context).pushNamed(
                                                          //     PlantScreen.routeName);
                                                          setState(() {
                                                            isLoading = true;
                                                          });
                                                          saveForm();
                                                        },
                                                        child: Text('Login')))
                                              ],
                                            ))
                                      ],
                                    ),
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    height: constraints.maxHeight * 0.3,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ],
                              ),
                              height: constraints.maxHeight * 0.6,
                              decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(150))),
                            ),
                          ),
                        ],
                      );
                    })),
              ));
  }
}
