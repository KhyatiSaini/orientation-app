import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:orientation_app/classes/club.dart';
import 'package:orientation_app/utilities/constants.dart';

class Clubs extends ChangeNotifier {
  List<Club> _clubs = [];


  List<Club> get clubs => [..._clubs];

  Future<void> fetchAndSetClubs() async {
    try {
      final String url = baseUrl + "/clubs/?format=json";
      print(url);
      Response response = await get(url);
      List data = json.decode(response.body);
      _clubs = [];
      if (response.statusCode == 200) {
        for (int i = 0; i < data.length; i++) {
          _clubs.add(Club(
              data[i]["id"],
              data[i]["clubname"],
              data[i]["description"],
              data[i]["imageurl"],
              President(
                  data[i]["president"]["id"],
                  data[i]["president"]["name"],
                  data[i]["president"]["imageurl"]),
              VicePresident(
                  data[i]["vice_president"]["id"],
                  data[i]["vice_president"]["name"],
                  data[i]["vice_president"]["imageurl"])));
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
