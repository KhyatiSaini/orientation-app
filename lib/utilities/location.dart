import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Future<Map> getLocationHighAccuracy() async {
    Map location = new Map();
    try {
      Position position =
          // ignore: deprecated_member_use
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      location['latitude'] = position.latitude;
      location['longitude'] = position.longitude;
      location['altitude'] = position.altitude;
      location['accuracy'] = position.accuracy;
    } catch (e) {
      location['error'] = e;
      throw Exception();
    }

    return location;
  }

  Future<Map> getLocationLowAccuracy() async {
    Map location = new Map();
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      location['latitude'] = position.latitude;
      location['longitude'] = position.longitude;
      location['altitude'] = position.altitude;
      location['accuracy'] = position.accuracy;
    } catch (e) {
      location['error'] = e;
      throw Exception();
    }
    return location;
  }

  Future<Position> getPosition(String location) async {
    Position positionStream;
    positionStream = (await GeocodingPlatform.instance.locationFromAddress(location)) as Position;
    return positionStream;
  }
}
