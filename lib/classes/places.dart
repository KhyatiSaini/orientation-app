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
        name: "Shivalik Boys Hostel",
        description: "Hostel"),
    Place(
        locationCoords: LatLng(31.709067628095617, 76.52385301887989),
        name: "Himadari Boys Hostel",
        description: "Hostel"),
    Place(
        locationCoords: LatLng(31.708348563583904, 76.52360055595636),
        name: "Himgiri Boys Hostel",
        description: "Hostel"),
    Place(
        locationCoords: LatLng(31.710757878370558, 76.52378059923649),
        name: "Neelkanth Boys Hostel",
        description: "Hostel"),
    Place(
        locationCoords: LatLng(31.703826686632805, 76.52605276554823),
        name: "Parvati Girls Hostel",
        description: "Hostel"),
    Place(
        locationCoords: LatLng(31.704113072056426, 76.52539327740669),
        name: "Ambika Girls Hostel",
        description: "Hostel"),
    Place(
        locationCoords: LatLng(31.707356524931253, 76.52819249778986),
        name: "Zehri",
        description: "Food"),
    Place(
        locationCoords: LatLng(31.706854226443117, 76.52906723320484),
        name: "Verka",
        description: "Food"),
    Place(
        locationCoords: LatLng(31.708627233832242, 76.52280125766993),
        name: "Food Court",
        description: "Food"),

  ];

  List<Place> get places => [..._places];
}
