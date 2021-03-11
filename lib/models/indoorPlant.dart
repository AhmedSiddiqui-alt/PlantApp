import 'package:flutter/material.dart';

class IndoorPlant {
  final String id;
  final String image;
  final String name;
  final String price;
  final String description;
  IndoorPlant({
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.description,
    @required this.price,
  });
}
