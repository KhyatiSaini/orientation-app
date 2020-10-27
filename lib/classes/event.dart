import 'package:flutter/cupertino.dart';

class Event {
  final String id;
  final String eventName;
  final String description;
  final String imageUrl;

  Event(
      {@required this.id,
      @required this.eventName,
      @required this.description,
      @required this.imageUrl});
}
