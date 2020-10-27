import 'package:flutter/cupertino.dart';

class Event {
  final String id;
  final String sportName;
  final String description;
  final String imageUrl;

  Event(
      {@required this.id,
        @required this.sportName,
        @required this.description,
        @required this.imageUrl});
}
