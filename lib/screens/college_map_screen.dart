import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orientation_app/classes/place.dart';
import '../classes/places.dart';

class NithMapScreen extends StatefulWidget {
  static String route = "/collegemap";

  @override
  _NithMapScreenState createState() => _NithMapScreenState();
}

class _NithMapScreenState extends State<NithMapScreen> {
  final LatLng position = LatLng(31.7076, 76.5274);
  GoogleMapController googleMapController;
  Places places = new Places();
  Set<Marker> markers = {};
  PageController _pageController;

  @override
  void initState() {
    for (Place place in places.places) {
      markers.add(Marker(
          markerId: MarkerId(place.locationCoords.toString()),
          draggable: false,
          infoWindow: InfoWindow(title: place.name),
          position: place.locationCoords));
    }
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: GoogleMap(
                onTap: (location) {
                  print(location);
                },
                initialCameraPosition: CameraPosition(
                  target: position,
                  zoom: 16
                ),
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                },
                markers: markers),
          ),
        ]));
  }
}
