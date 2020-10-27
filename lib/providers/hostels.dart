import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:orientation_app/classes/hostel.dart';
import 'package:orientation_app/utilities/constants.dart';

class Hostels extends ChangeNotifier {
  List<Hostel> _hostels = [];

  List<Hostel> get hostels => _hostels;

  Future<void> fetchAndSetHostels() async {
    try {
      final String url = baseUrl + "/hostels/?format=json";
      print(url);
      Response response = await get(url);
      List data = json.decode(response.body);
      _hostels = [];
      if (response.statusCode == 200) {
        for (int i = 0; i < data.length; i++) {
          _hostels.add(Hostel(
              id: data[i]["id"],
              hostelName: data[i]["HostelName"],
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
