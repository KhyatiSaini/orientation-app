import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:orientation_app/classes/placetovisit.dart';
import 'package:orientation_app/utilities/constants.dart';

class PlacesToVisitProvider extends ChangeNotifier {
  List<PlaceToVisit> _placesToVisit = [];

  List<PlaceToVisit> get placesToVisit => [..._placesToVisit];

  Future<void> fetchAndSetPlaceToVisit() async {
    try {
      final String url = baseUrl + "/placestovisit/?format=json";
      print(url);
      Response response = await get(url);
      List data = jsonDecode(response.body);
      print(response.body);
      _placesToVisit = [];
      if (response.statusCode == 200) {
        for (int i = 0; i < data.length; i++) {
          _placesToVisit.add(PlaceToVisit(
              id: data[i]["id"],
              placeName: data[i]["PlaceName"],
              distance: data[i]["distance"],
              imageUrl: data[i]["imageUrl"],
              description: utf8.decode(utf8.encode(data[i]["description"]))));
          print(data[i]["description"]);
        }
        notifyListeners();
      } else {
        throw Exception("Invalid Status");
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
