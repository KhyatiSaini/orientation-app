import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utilities/location.dart';

class ChooseLocation extends StatefulWidget {
  static String route = "/chooselocation";
  LatLng initiallocation;

  ChooseLocation(this.initiallocation);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  LatLng location;
  LatLng initialPos;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop(location);
              })
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GoogleMap(
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          markers: {
            if (location != null)
              Marker(
                  markerId: MarkerId(location.toString()), position: location)
          },
          indoorViewEnabled: true,
          initialCameraPosition:
              CameraPosition(target: widget.initiallocation, zoom: 16),
          onTap: (Location) {
            setState(() {
              location = Location;
            });
          },
        ),
      ),
    );
  }
}
