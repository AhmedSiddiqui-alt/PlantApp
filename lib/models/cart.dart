import 'package:flutter/material.dart';

class Cart {
  final String productId;
  final String cartId;
  final String productName;
  final double productPrice;
  final String productImage;
  final int productQuantity;
  Cart(
      {@required this.productId,
      @required this.cartId,
      @required this.productName,
      @required this.productPrice,
      @required this.productQuantity,
      @required this.productImage});
}
