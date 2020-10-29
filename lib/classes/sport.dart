import 'package:flutter/cupertino.dart';

class Sport {
  final String id;
  final String sportName;
  final String description;
  final String imageUrl;

  Sport(
      {@required this.id,
        @required this.sportName,
        @required this.description,
        @required this.imageUrl});
}
