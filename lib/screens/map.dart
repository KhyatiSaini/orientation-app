import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  LatLng _location;

  Map(this._location);
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:
      CameraPosition(target: widget._location, zoom: 14),
      markers: {
        Marker(
            markerId: MarkerId(widget._location.toString()),
            position: widget._location)
      },
    );
  }
}

