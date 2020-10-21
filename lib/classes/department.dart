import 'package:flutter/cupertino.dart';

class Department {
  final String id;
  final String departmentName;
  final String description;
  final String imageUrl;

  Department(
      {@required this.id,
      @required this.departmentName,
      @required this.description,
      @required this.imageUrl});
}
