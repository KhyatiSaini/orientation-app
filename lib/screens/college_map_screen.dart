import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NithMapScreen extends StatefulWidget {
  static String route = "/collegemap";

  @override
  _NithMapScreenState createState() => _NithMapScreenState();
}

class _NithMapScreenState extends State<NithMapScreen> {
  final LatLng position = LatLng(31.7076, 76.5274);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NIT Hamirpur Map"),
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: position,
            zoom: 16,
          ),
          markers: {
            Marker(position: position, markerId: MarkerId(position.toString()))
          }),
    );
  }
}
