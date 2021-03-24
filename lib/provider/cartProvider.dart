import 'package:flutter/cupertino.dart';

import '../models/cart.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};
  Map<String, Cart> get _cartItemsList {
    return {..._cartItems};
  }

  int q = 1;
  Future<dynamic> GetCartItems(String productId) async {
    final url =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/Cart.json?&orderBy="productId"&equalTo="$productId"';

    try {
      final cartBody = await http.get(url);
      final getExtractedData =
          await json.decode(cartBody.body) as Map<String, dynamic>;
      // notifyListeners();
      if (getExtractedData != null) {
        return 1;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  int get cartLength {
    return _cartItems.length;
  }

  Future<void> getAllCartItems(String customerId) async {
    try {
      final url =
          'https://pmbac-269e8-default-rtdb.firebaseio.com/Cart.json?&orderBy="customerId"&equalTo="$customerId"';
      final responseBody = await http.get(url);
      final extractedData =
          await json.decode(responseBody.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        if (extractedData != null) {
          Cart(
              productId: value['productId'],
              cartId: key,
              productName: value['productName'],
              productPrice: double.parse(value['productPrice']),
              productQuantity: int.parse(value['productQuantity']),
              productImage: value['productImage']);
        } else {
          return null;
        }
        notifyListeners();
      });
    } catch (error) {
      throw error;
    }
  }

  Future<void> AddItemsToCart(String customerId, String productIdd, String name,
      double price, String image) async {
    // var checkCondition = GetCartItems(productId);
    final url = 'https://pmbac-269e8-default-rtdb.firebaseio.com/Cart.json';
    final updateUrl =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/Cart.json?&orderBy="productId"&equalTo="$productIdd"';
    final customerCheckUrl =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/Cart.json?&orderBy="customerId"&equalTo="$customerId"';
    try {
      final cartBody = await http.get(updateUrl);
      final checkCustomerExistence = await http.get(customerCheckUrl);
      final getCustomerDataExistence = await json
          .decode(checkCustomerExistence.body) as Map<String, dynamic>;
      final getExtractedData =
          await json.decode(cartBody.body) as Map<String, dynamic>;
      print(getExtractedData);
      var cartId;
      var quantity;
      if (getExtractedData.isNotEmpty && getCustomerDataExistence.isNotEmpty) {
        getExtractedData.forEach((key, value) {
          cartId = key;
          quantity = int.parse(value['productQuantity']);
        });
        final patchUrl =
            'https://pmbac-269e8-default-rtdb.firebaseio.com/Cart/$cartId.json';
        print('I am here');
        q = quantity + 1;
        final responseBody = await http.patch(patchUrl,
            body: json.encode({
              'customerId': customerId,
              'productId': productIdd,
              'productName': name,
              'productPrice': price.toString(),
              'productQuantity': q.toString(),
              'image': image
            }));
        print('I am here again');
        print(json.decode(responseBody.body));
        _cartItems.update(productIdd.toString(), (existingCartItem) {
          return Cart(
              productId: existingCartItem.productId,
              cartId: existingCartItem.cartId,
              productName: existingCartItem.productName,
              productPrice: existingCartItem.productPrice,
              productQuantity: existingCartItem.productQuantity + 1,
              productImage: existingCartItem.productImage);
        });
      } else {
        final responseBody = await http.post(url,
            body: json.encode({
              'customerId': customerId,
              'productId': productIdd.toString(),
              'productName': name,
              'productPrice': price.toString(),
              'productQuantity': '1',
              'image': image
            }));
        _cartItems.putIfAbsent(
            productIdd.toString(),
            () => Cart(
                productId: productIdd,
                cartId: json.decode(responseBody.body)['name'],
                productName: name,
                productPrice: price,
                productQuantity: 1,
                productImage: image));
      }
      notifyListeners();
    } catch (caughtError) {
      print(caughtError);
    }
  }
}
