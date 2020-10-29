import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:orientation_app/classes/society.dart';
import 'package:orientation_app/utilities/constants.dart';

class Societies extends ChangeNotifier {
  List<Society> _societies = [];

  List<Society> get societies => [..._societies];

  Future<void> fetchAndSetSocieties() async {
    try {
      final String url = baseUrl + "/socities/?format=json";
      print(url);
      Response response = await get(url);
      List data = json.decode(response.body);
      _societies = [];
      if (response.statusCode == 200) {
        for (int i = 0; i < data.length; i++) {
          _societies.add(Society(
              data[i]["id"],
              data[i]["SocietyName"],
              data[i]["description"],
              data[i]["imageUrl"],
              President(
                  data[i]["President"]["presidentId"],
                  data[i]["President"]["name"],
                  data[i]["President"]["image"]),
              VicePresident(
                  data[i]["VicePresident"]["vicepresidentId"],
                  data[i]["VicePresident"]["name"],
                  data[i]["VicePresident"]["image"])));
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
