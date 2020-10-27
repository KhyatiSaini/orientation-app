import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place{
  String name;
  String address;
  String description;
  String thumbnail;
  LatLng locationCoords;

  Place({this.name, this.address, this.description, this.locationCoords});
}