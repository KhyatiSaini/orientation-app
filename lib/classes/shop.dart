import 'package:flutter/cupertino.dart';

class Shop {
  final String id;
  final String shopName;
  final String description;
  final String imageUrl;

  Shop(
      {@required this.id,
        @required this.shopName,
        @required this.description,
        @required this.imageUrl});
}
