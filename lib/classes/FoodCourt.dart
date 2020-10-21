import 'package:flutter/cupertino.dart';

class FoodCourt {
  final String id;
  final String foodCourtName;
  final String description;
  final String imageUrl;

  FoodCourt(
      {@required this.id,
      @required this.foodCourtName,
      @required this.description,
      @required this.imageUrl});
}
