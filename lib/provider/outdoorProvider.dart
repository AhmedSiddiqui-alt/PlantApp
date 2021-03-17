import 'package:flutter/material.dart';
import '../models/outdoorPlant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OutdoorPlantsProvider with ChangeNotifier {
  List<OutdoorPlant> _outdoorPlant = [];
  List<OutdoorPlant> get outoorPlantData {
    return [..._outdoorPlant];
  }

  Future<void> storeOutdoorPlantsDetails(
      String image, String name, String price, String description) {
    final url =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/OutdoorPlants.json';
    try {
      final responseData = http.post(url,
          body: json.encode({
            'outdoorPlantName': name,
            'outdoorPlantImage': image,
            'outdoorPlantPrice': price,
            'outdoorPlantDescription': description
          }));
    } catch (caughtError) {
      throw caughtError;
    }
  }

  Future<void> fetchOutdoorPlantsData() async {
    final url =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/OutdoorPlants.json';
    try {
      final response = await http.get(url);
      final extractedData =
          await json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        _outdoorPlant.add(OutdoorPlant(
            id: key,
            image: value['outdoorPlantImage'],
            name: value['outdoorPlantName'],
            description: value['outdoorPlantDescription'],
            price: double.parse(value['outdoorPlantPrice'])));
      });
      print('Hello');
      print(extractedData);
      print('Hello');
      // print(indoorPlantData[0].image);
      notifyListeners();
    } catch (caughtError) {
      throw caughtError;
    }
  }
}
