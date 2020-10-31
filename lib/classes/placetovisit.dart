import 'package:flutter/cupertino.dart';

class PlaceToVisit {
  final String id;
  final String placeName;
  final String description;
  final String imageUrl;
  final int distance;

  PlaceToVisit(
      {@required this.id,
      @required this.placeName,
      @required this.description,
      @required this.imageUrl,
      @required this.distance});
}
