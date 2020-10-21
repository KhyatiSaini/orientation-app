import 'package:flutter/cupertino.dart';

class Hostel {
  final String id;
  final String hostelName;
  final String description;
  final String imageUrl;

  Hostel(
      {@required this.id,
      @required this.hostelName,
      @required this.description,
      @required this.imageUrl});
}
