import 'package:flutter/material.dart';
import '../widgets/registerContainerWidget.dart';
import '../provider/customerProvider.dart';
import '../models/customer.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = 'regiterScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController passwordController = TextEditingController();
  var customerData =
      Customer(id: null, customerEmail: null, customerPassword: null);
  void saveForm() async {
    print('I am here 0');

    try {
      print('I am here 1');

      _formkey.currentState.save();
      print('I am here 2');
      print(customerData.customerEmail);
      print(customerData.customerPassword);
      await Provider.of<CustomerProvider>(context)
          .resgisterVoter(
              customerData.customerEmail, customerData.customerPassword)
          .then((value) => {
                setState(() {
                  isLoading = false;
                }),
                Navigator.of(context).pop()
              });
      print('I am here 3');
    } catch (error) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(error),
              actions: <Widget>[
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(25)),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Okay')))
              ],
            );
          });
    }
    // finally {

    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.green[400],
              ))
            : SingleChildScrollView(
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
                                            key: _formkey,
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
                                                    decoration: InputDecoration(
                                                        labelText: 'Email',
                                                        suffixIcon: Icon(
                                                          Icons.mail,
                                                          color:
                                                              Colors.green[400],
                                                        )),
                                                    onSaved: (email) {
                                                      customerData = Customer(
                                                          id: customerData.id,
                                                          customerEmail: email,
                                                          customerPassword:
                                                              customerData
                                                                  .customerPassword);
                                                    },
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
                                                  child: TextField(
                                                    controller:
                                                        passwordController,
                                                    // onChanged: (value) {
                                                    //   passwordController.text = value;
                                                    // },
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                        labelText: 'Password',
                                                        suffixIcon: Icon(
                                                          Icons.lock,
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
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            'Confirm Password',
                                                        suffixIcon: Icon(
                                                          Icons.lock,
                                                          color:
                                                              Colors.green[400],
                                                        )),
                                                    validator: (cnfrmPassword) {
                                                      if (cnfrmPassword !=
                                                          passwordController
                                                              .text) {
                                                        print(cnfrmPassword);
                                                        print(passwordController
                                                            .text);
                                                        return 'Your Password doesn\'t match';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (password) {
                                                      customerData = Customer(
                                                          id: customerData.id,
                                                          customerEmail:
                                                              customerData
                                                                  .customerEmail,
                                                          customerPassword:
                                                              password);
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                    height:
                                                        constraints.maxHeight *
                                                            0.06,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.green[400],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: FlatButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            print(
                                                                'I am here 2');

                                                            isLoading = true;
                                                          });
                                                          saveForm();
                                                        },
                                                        child:
                                                            Text('Register')))
                                              ],
                                            ))
                                      ],
                                    ),
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    height: constraints.maxHeight * 0.39,
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
