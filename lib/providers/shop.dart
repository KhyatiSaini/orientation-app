import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:orientation_app/utilities/constants.dart';

import '../classes/shop.dart';

class Shops extends ChangeNotifier {
  List<Shop> _shops = [];

  List<Shop> get shops => [..._shops];

  Future<void> fetchAndSetShops() async {
    try {
      final String url = baseUrl + "/shops/?format=json";
      print(url);
      Response response = await get(url);
      List data = json.decode(response.body);
      _shops = [];
      if (response.statusCode == 200) {
        for (int i = 0; i < data.length; i++) {
          _shops.add(Shop(
              id: data[i]["id"],
              shopName: data[i]["ShopName"],
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
