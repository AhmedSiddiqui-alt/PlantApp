import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/customer.dart';
import '../models/auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CustomerProvider with ChangeNotifier {
  List<Customer> customerData = [];

  List<Customer> get custData {
    return [...customerData];
  }

  String emailCust;
  CustomerProvider({@required this.emailCust});

  Future<void> authSignup(String key, String email, String password) async {
    final url = 'https://pmbac-269e8-default-rtdb.firebaseio.com/Auth.json';
    try {
      await http.post(url,
          body: json.encode(
              {"authKey": key, 'authEmail': email, 'authPassword': password}));
      notifyListeners();
    } catch (caughtError) {
      throw caughtError;
    }
  }

  Future<void> getCustomerData() async {
    print(emailCust + 'Test');
    final url =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/Customer.json?&orderBy="customerEmail"&equalTo="$emailCust"';
    try {
      final responseData = await http.get(url);
      final extractedData =
          await json.decode(responseData.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        customerData.add(Customer(
            id: key,
            customerEmail: value['customerEmail'],
            customerPassword: value['customerPassword']));
      });
      // print(custData[0].customerEmail + 'Test 2');
      notifyListeners();
    } catch (caughtError) {
      throw Exception(caughtError);
    }
  }

  void logoutCust() {
    emailCust = null;
    customerData = [];
    // print(customerData.length);
    notifyListeners();
  }

  Future<void> resgisterCustomer(String email, String password) async {
    final url = 'https://pmbac-269e8-default-rtdb.firebaseio.com/Customer.json';
    try {
      final getResponse = await http.post(url,
          body: json.encode({
            'customerEmail': email.toString(),
            'customerPassword': password.toString()
          }));
      await authSignup(json.decode(getResponse.body)['name'], email, password);
      customerData.add(Customer(
          id: json.decode(getResponse.body)['name'],
          customerEmail: email,
          customerPassword: password));
      notifyListeners();
    } catch (caughtError) {
      throw caughtError;
      // throw Exception('Server Error');
    }
  }
}
