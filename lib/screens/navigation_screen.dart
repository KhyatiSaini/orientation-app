import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orientation_app/utilities/location.dart';
import 'package:orientation_app/utilities/map.dart';

class NavigationScreen extends StatefulWidget {
  String route = '/navigation_screen';

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  CameraPosition cameraPosition = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController googleMapController;
  bool _showGoogleMap = false;
  LatLng latLng;
  final TextEditingController startAddressController = TextEditingController();
  final TextEditingController destinationAddressController = TextEditingController();
  String _startingAddress, _destinationAddress, _currentAddress, _distance;
  Set<Marker> markers = {};
  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final _key = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    startAddressController.dispose();
    destinationAddressController.dispose();
  }

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
    var lng = locationDetails['longitude'];
    setState(() {
      cameraPosition = CameraPosition(target: LatLng(lat, lng), zoom: 16);
      print('Current Location: $cameraPosition');
      _showGoogleMap = true;
      latLng = LatLng(lat, lng);

      if (googleMapController != null)
      {
         googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 16),
          ),
        );
      }
    });
    _getAddress();
  }

  _getAddress() async {
    try {
      print('Latitude Longitude is $latLng');
      String result = await LocationHelper.getPlaceAddress(
          latLng.latitude, latLng.longitude);
      print('The address is $result');
      _currentAddress = result;
      setState(() {
        _startingAddress = result;
        startAddressController.text = result;
      });
      print('$_startingAddress');
    } catch (e) {
      print(e);
      Exception();
    }
  }

  Future<bool> _calculateDistance() async {
    Location location = new Location();
    try {
      if (_startingAddress == null && _destinationAddress == null)
        return false;

      if (_startingAddress != null && _destinationAddress != null) {
        Position startPosition = await location.getPosition(_startingAddress);
        Position destinationPosition =
            await location.getPosition(_destinationAddress);
        // starting position marker
        Marker startMarker = Marker(
          markerId: MarkerId('$startPosition'),
          position: LatLng(
            startPosition.latitude,
            startPosition.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Start',
            snippet: _startingAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        // destination  position marker
        Marker destinationMarker = Marker(
          markerId: MarkerId('$destinationPosition'),
          position: LatLng(
            destinationPosition.latitude,
            destinationPosition.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: _destinationAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        markers.add(startMarker);
        markers.add(destinationMarker);

        print('Start coordinates: $startPosition');
        print('Destination coordinates: $destinationPosition');

        LatLngBounds latLngBounds;
        if (startPosition.latitude < destinationPosition.latitude && startPosition.longitude < destinationPosition.longitude) {
          latLngBounds = LatLngBounds(
            southwest: LatLng(startPosition.latitude, startPosition.longitude),
            northeast: LatLng(destinationPosition.latitude, destinationPosition.longitude),
          );
        } else if (startPosition.longitude < destinationPosition.longitude) {
          latLngBounds = LatLngBounds(
            southwest: LatLng(destinationPosition.latitude, startPosition.longitude),
            northeast: LatLng(startPosition.latitude, destinationPosition.longitude)
          );
        } else if (startPosition.latitude < destinationPosition.latitude) {
          latLngBounds = LatLngBounds(
            southwest: LatLng(startPosition.latitude, destinationPosition.longitude),
            northeast: LatLng(destinationPosition.latitude, startPosition.longitude)
          );
        } else {
          latLngBounds = LatLngBounds(
              southwest: LatLng(destinationPosition.latitude, destinationPosition.longitude),
              northeast: LatLng(startPosition.latitude, startPosition.longitude));
        }

        // accommodate the two locations within the camera view of map
        googleMapController.animateCamera(
          CameraUpdate.newLatLngBounds(
              latLngBounds,
              100.0),
        );

        await _createPolylines(startPosition, destinationPosition);

        double totalDistance = 0.0;

        // Calculating the total distance by adding the distance
        // between small segments
        for (int i = 0; i < polylineCoordinates.length - 1; i++) {
          totalDistance += _coordinateDistance(
            polylineCoordinates[i].latitude,
            polylineCoordinates[i].longitude,
            polylineCoordinates[i + 1].latitude,
            polylineCoordinates[i + 1].longitude,
          );
        }

        setState(() {
          _distance = totalDistance.toStringAsFixed(2);
          print('DISTANCE: $_distance km');
        });

        if (_startingAddress.compareTo(_destinationAddress) != 0 && _distance.compareTo("0.00") == 0)
          return false;
        return true;
      }
    } catch (e) {
      print(e);
      Exception();
    }
    return false;
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Creating polylines for showing the route between two places
  _createPolylines(Position start, Position destination) async {
    polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_API_KEY, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
  }

  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        height: double.infinity,
        width: double.infinity,
        key: _key,
        child: Container(
          child: _showGoogleMap
              ? Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: cameraPosition,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      mapType: MapType.normal,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,
                      markers:
                          markers != null ? Set<Marker>.from(markers) : null,
                      onMapCreated: (GoogleMapController controller) {
                        googleMapController = controller;
                      },
                      polylines: Set<Polyline>.of(polylines.values),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.all(10),
                      child: ClipOval(
                          child: Material(
                        color: Colors.blue,
                        child: InkWell(
                          splashColor: Colors.white70,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.my_location, color: Colors.white),
                          ),
                          onTap: () {
                            //my location
                            getLocation();
                            // _getAddress();
                          },
                        ),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 500),
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Container(
                              child: Material(
                                color: Colors.blue.withOpacity(0.9),
                                child: InkWell(
                                  splashColor: Colors.white70,
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                  onTap: () {
                                    googleMapController.animateCamera(
                                      CameraUpdate.zoomIn(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Material(
                                color: Colors.blue.withOpacity(0.9),
                                child: InkWell(
                                  splashColor: Colors.white70,
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child:
                                        Icon(Icons.remove, color: Colors.white),
                                  ),
                                  onTap: () {
                                    googleMapController.animateCamera(
                                      CameraUpdate.zoomOut(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          width: double.infinity * 0.9,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Places',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  enableSuggestions: true,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.streetAddress,
                                  controller: startAddressController,
                                  onChanged: (String value) {
                                    _startingAddress = value;
                                    print('Starting address $_startingAddress');
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey[100],
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          width: 2, color: Colors.grey[500]),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          width: 2, color: Colors.grey[500]),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    prefixIcon: Icon(Icons.looks_one,
                                        color: Colors.grey[400]),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.my_location),
                                      onPressed: () {
                                        _getAddress();
                                        _calculateDistance();
                                        startAddressController.text =
                                            _currentAddress;
                                        _startingAddress = _currentAddress;
                                      },
                                    ),
                                    hintText: "Choose starting position",
                                    labelText: "Start",
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  enableSuggestions: true,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.streetAddress,
                                  controller: destinationAddressController,
                                  onChanged: (String value) {
                                    _destinationAddress = value;
                                    print(
                                        'Destination address is $_destinationAddress');
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey[100],
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          width: 2, color: Colors.grey[500]),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          width: 2, color: Colors.grey[500]),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    prefixIcon: Icon(Icons.looks_two,
                                        color: Colors.grey[400]),
                                    hintText: "Choose destination",
                                    labelText: "Destination",
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Visibility(
                                  visible: (_distance == null || _distance.compareTo("0.00") == 0) ? false : true,
                                  child: Text(
                                    'DISTANCE: $_distance km',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                RaisedButton(
                                  onPressed: (_startingAddress == '' && _destinationAddress == '') ?
                                  () => Fluttertoast.showToast(
                                      msg: 'Please enter starting and destination address',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.white,
                                      textColor: Colors.blue,
                                      fontSize: 16.0
                                  ) : () async {
                                    setState(() {
                                      if (markers.isNotEmpty)
                                        markers.clear();
                                      if (polylines.isNotEmpty)
                                        polylines.clear();
                                      if (polylineCoordinates.isNotEmpty)
                                        polylineCoordinates.clear();
                                      _distance = null;
                                    });

                                    _calculateDistance()
                                        .then((value) {
                                          if (!value) {
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(content: Text('Error Calculating Distance'))
                                            );
                                          }
                                          else {
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(content: Text('Distance Calculated Successfully'))
                                            );
                                          }
                                    });
                                  },
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Show Route'.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                    size: 60,
                  ),
                ),
        ),
      ),
    );
  }
}
