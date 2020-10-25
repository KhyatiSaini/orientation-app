import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utilities/location.dart';

class LocationScreen extends StatefulWidget {
  static String route = "/location-screen";

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController googleMapController;
  CameraPosition cameraPosition =
      CameraPosition(target: LatLng(0, 0), zoom: 16);
  bool showMap = false;
  LatLng latLng;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = new Location();
    var locationDetails = await location.getLocationHighAccuracy();
    print(locationDetails);
    var lat = locationDetails['latitude'];
    var lang = locationDetails['longitude'];
    setState(() {
      cameraPosition = CameraPosition(target: LatLng(lat, lang), zoom: 16);
      showMap = true;
      latLng = LatLng(lat, lang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: !showMap
            ? CircularProgressIndicator()
            : Stack(children: [
                GoogleMap(
                  initialCameraPosition: cameraPosition,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                  markers: {
                    Marker(
                        position: latLng, markerId: MarkerId(latLng.toString()))
                  },
                  myLocationButtonEnabled: true,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(
                          child: Material(
                            color: Colors.blue[100],
                            child: InkWell(
                              splashColor: Colors.blue,
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(Icons.add),
                              ),
                              onTap: () {
                                googleMapController.animateCamera(
                                  CameraUpdate.zoomIn(),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ClipOval(
                          child: Material(
                            color: Colors.blue[100],
                            child: InkWell(
                              splashColor: Colors.blue,
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(Icons.remove),
                              ),
                              onTap: () {
                                googleMapController.animateCamera(
                                  CameraUpdate.zoomOut(),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
      ),
    );
  }
}
