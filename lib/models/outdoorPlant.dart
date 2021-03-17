import 'package:flutter/material.dart';

class OutdoorPlant {
  final String id;
  final String image;
  final String name;
  final double price;
  final String description;
  OutdoorPlant({
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.description,
    @required this.price,
  });
}
