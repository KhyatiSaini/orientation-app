import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:orientation_app/classes/sport.dart';
import 'package:orientation_app/utilities/constants.dart';

class Sports extends ChangeNotifier {
  List<Sport> _sports = [];

  List<Sport> get sports => [..._sports];

  Future<void> fetchAndSetSports() async {
    try {
      final String url = baseUrl + "/sports/?format=json";
      print(url);
      Response response = await get(url);
      List data = json.decode(response.body);
      _sports = [];
      if (response.statusCode == 200) {
        for (int i = 0; i < data.length; i++) {
          _sports.add(Sport(
              id: data[i]["id"],
              sportName: data[i]["SportName"],
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
