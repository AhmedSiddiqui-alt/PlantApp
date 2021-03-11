import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth.dart';

class AuthProvider with ChangeNotifier {
  var emailCust;
  List<Auth> authData = [];
  List<Auth> get authCustomerData {
    return [...authData];
  }

  String get getEmail {
    if (emailCust == null) {
      return null;
    } else {
      return emailCust;
    }
  }

  bool get checkEmail {
    print(emailCust);
    if (emailCust == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> loginCustomer(String email, String password) async {
    final urlByEmail =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/Auth.json?&orderBy="authEmail"&equalTo="$email"';
    final urlByPassword =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/Auth.json?&orderBy="authPassword"&equalTo="$password"';
    try {
      print(email);
      print(password);
      final responseDataByEmail = await http.get(urlByEmail);
      final responseDataByPassword = await http.get(urlByPassword);
      final extractedDataByEmail =
          await json.decode(responseDataByEmail.body) as Map<String, dynamic>;
      final extractedDataByPassword = await json
          .decode(responseDataByPassword.body) as Map<String, dynamic>;
      var getkeyByEmail;
      var getKeyByPassword;
      print(extractedDataByEmail);
      print(extractedDataByPassword);
      extractedDataByEmail.forEach((key, value) {
        getkeyByEmail = value['authKey'];
      });
      extractedDataByPassword.forEach((key, value) {
        getKeyByPassword = value['authKey'];
      });
      print(getkeyByEmail);
      print(getKeyByPassword);
      if (getkeyByEmail == getKeyByPassword) {
        print(extractedDataByEmail);
        extractedDataByEmail.forEach((key, value) {
          emailCust = value['authEmail'];

          authData.add(Auth(
              key: key,
              authEmail: value['authEmail'],
              authPassword: value['authPassword']));
        });
        notifyListeners();
      } else {
        print('Firstly I AM Here');
        throw Exception('Incorrect Email & Password');
      }
    } catch (caughtError) {
      throw Exception('Incorrect Email & Password');
    }
  }
}
