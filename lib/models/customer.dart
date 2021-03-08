import 'package:flutter/material.dart';

class Customer {
  final String id;
  final String customerEmail;
  final String customerPassword;
  Customer(
      {@required this.id,
      @required this.customerEmail,
      @required this.customerPassword});
}
