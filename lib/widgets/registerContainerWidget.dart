// import 'package:flutter/material.dart';
// import '../screens/plantScreen.dart';
// import '../provider/customerProvider.dart';
// import '../models/customer.dart';
// import 'package:provider/provider.dart';

// class RegisterContainer extends StatefulWidget {
//   @override
//   _RegisterContainerState createState() => _RegisterContainerState();
// }

// class _RegisterContainerState extends State<RegisterContainer> {
//   final _formkey = GlobalKey<FormState>();
//   bool isLoading = false;
//   TextEditingController passwordController = TextEditingController();
//   var customerData =
//       Customer(id: null, customerEmail: null, customerPassword: null);
//   void saveForm() async {
//     print('I am here 0');

//     try {
//       print('I am here 1');

//       _formkey.currentState.save();
//       print('I am here 2');
//       print(customerData.customerEmail);
//       print(customerData.customerPassword);
//       await Provider.of<CustomerProvider>(context).resgisterVoter(
//           customerData.customerEmail, customerData.customerPassword);
//       print('I am here 3');
//     } catch (error) {
//       showDialog(
//           context: context,
//           builder: (ctx) {
//             return AlertDialog(
//               title: Text('Server Error'),
//               actions: <Widget>[
//                 Container(
//                     height: 100,
//                     decoration: BoxDecoration(
//                         color: Colors.green[400],
//                         borderRadius: BorderRadius.circular(25)),
//                     child: FlatButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(false);
//                         },
//                         child: Text('Okay')))
//               ],
//             );
//           });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//       Navigator.of(context).pop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (ctx, constraints) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           isLoading
//               ? Center(
//                   child: CircularProgressIndicator(
//                   backgroundColor: Colors.green[400],
//                 ))
//               : Container(
//                   child: Column(
//                     children: <Widget>[
//                       Center(
//                         child: ClipOval(
//                             child: Container(
//                                 height: constraints.maxHeight * 0.2,
//                                 child: Image.asset(
//                                   'assets/images/LoginLogo.png',
//                                   height: 120,
//                                 ))),
//                       ),
//                       Form(
//                           key: _formkey,
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     left: 5, right: 5, bottom: 5),
//                                 height: constraints.maxHeight * 0.1,
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                       labelText: 'Email',
//                                       suffixIcon: Icon(
//                                         Icons.mail,
//                                         color: Colors.green[400],
//                                       )),
//                                   onSaved: (email) {
//                                     customerData = Customer(
//                                         id: customerData.id,
//                                         customerEmail: email,
//                                         customerPassword:
//                                             customerData.customerPassword);
//                                   },
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     left: 5, right: 5, bottom: 5),
//                                 height: constraints.maxHeight * 0.1,
//                                 child: TextField(
//                                   controller: passwordController,
//                                   // onChanged: (value) {
//                                   //   passwordController.text = value;
//                                   // },
//                                   obscureText: true,
//                                   decoration: InputDecoration(
//                                       labelText: 'Password',
//                                       suffixIcon: Icon(
//                                         Icons.lock,
//                                         color: Colors.green[400],
//                                       )),
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     left: 5, right: 5, bottom: 5),
//                                 height: constraints.maxHeight * 0.1,
//                                 child: TextFormField(
//                                   obscureText: true,
//                                   decoration: InputDecoration(
//                                       labelText: 'Confirm Password',
//                                       suffixIcon: Icon(
//                                         Icons.lock,
//                                         color: Colors.green[400],
//                                       )),
//                                   validator: (cnfrmPassword) {
//                                     if (cnfrmPassword !=
//                                         passwordController.text) {
//                                       print(cnfrmPassword);
//                                       print(passwordController.text);
//                                       return 'Your Password doesn\'t match';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (password) {
//                                     customerData = Customer(
//                                         id: customerData.id,
//                                         customerEmail:
//                                             customerData.customerEmail,
//                                         customerPassword: password);
//                                   },
//                                 ),
//                               ),
//                               Container(
//                                   height: constraints.maxHeight * 0.1,
//                                   decoration: BoxDecoration(
//                                       color: Colors.green[400],
//                                       borderRadius: BorderRadius.circular(25)),
//                                   child: FlatButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           isLoading = true;
//                                         });
//                                         saveForm();
//                                       },
//                                       child: Text('Register')))
//                             ],
//                           ))
//                     ],
//                   ),
//                   margin: EdgeInsets.only(left: 10, right: 10),
//                   height: constraints.maxHeight * 0.65,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//         ],
//       );
//     });
//   }
// }
