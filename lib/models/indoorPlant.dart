import 'package:flutter/material.dart';

class IndoorPlant {
  final String id;
  final String image;
  final String name;
  final double price;
  final String description;
  IndoorPlant({
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.description,
    @required this.price,
  });
}
