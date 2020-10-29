import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:orientation_app/classes/FoodCourt.dart';
import 'package:orientation_app/utilities/constants.dart';

class PlacesToEat extends ChangeNotifier{
  List<FoodCourt> _placesToEat= [];

  List<FoodCourt> get placesToEat => [..._placesToEat];


  Future<void> fetchAndSetPlaceToEat() async {
    try {
      final String url = baseUrl + "/foodcourts/?format=json";
      print(url);
      Response response = await get(url);
      List data = json.decode(response.body);
      _placesToEat = [];
      if (response.statusCode == 200) {
        for (int i = 0; i < data.length; i++) {
          _placesToEat.add(FoodCourt(
              id: data[i]["id"],
              foodCourtName: data[i]["Name"],
              imageUrl: data[i]["imageUrl"],
              description: data[i]["description"]));
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
