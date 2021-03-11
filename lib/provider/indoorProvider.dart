import 'package:flutter/material.dart';
import '../models/indoorPlant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IndoorPlantsProvider with ChangeNotifier {
  List<IndoorPlant> _indoorPlant = [];
  List<IndoorPlant> get indoorPlantData {
    return [..._indoorPlant];
  }

  Future<void> storeIndoorPlantsDetails(
      String image, String name, String price, String description) {
    final url =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/IndoorPlants.json';
    try {
      final responseData = http.post(url,
          body: json.encode({
            'indoorPlantName': name,
            'indoorPlantImage': image,
            'indoorPlantPrice': price,
            'indoorPlantDescription': description
          }));
    } catch (caughtError) {
      throw caughtError;
    }
  }

  Future<void> fetchIndoorPlantsData() async {
    final url =
        'https://pmbac-269e8-default-rtdb.firebaseio.com/IndoorPlants.json';
    try {
      final response = await http.get(url);
      final extractedData =
          await json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        _indoorPlant.add(IndoorPlant(
            id: key,
            image: value['indoorPlantImage'],
            name: value['indoorPlantName'],
            description: value['indoorPlantDescription'],
            price: value['indoorPlantPrice']));
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
