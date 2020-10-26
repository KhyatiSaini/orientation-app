import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'place.dart';

class Places {
  List<Place> _places = [
    Place(locationCoords: LatLng(31.70757130590761, 76.5273704007268),
    name: "NIT Hamirpur"),
    Place(
        locationCoords: LatLng(31.71040363002099, 76.52672130614519),
        name: "Kailash boys hostel",
        description: "Boys hostel"),
    Place(
        locationCoords: LatLng(31.71209414116398, 76.52577247470617),
        name: "Manimahesh Girls Hostel",
        description: "Manimahesh hostel"),
    Place(
        locationCoords: LatLng(31.713635739524644, 76.52549587190151),
        name: "Satpura Hostel",
        description: "Hostel"),
    Place(
        locationCoords: LatLng(31.71290530175726, 76.52671225368977),
        name: "Shivalik Hostel",
        description: "Hostel"),
    Place(
        locationCoords: LatLng(31.709196551409114, 76.52383759617805),
        name: "Himadari Hostel",
        description: "Hostel")
  ];

  List<Place> get places => [..._places];
}
