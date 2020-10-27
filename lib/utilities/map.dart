import 'package:http/http.dart';
import 'dart:convert';

const GOOGLE_API_KEY = 'AIzaSyD8mV2YNOuiucoiS39ARdXxbg8Rv7fSu9U';

class LocationHelper {
  static String generateLocationUrl({double lat, double lang}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$lang&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7C$lat,$lang&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    Response response = await get(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY");
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
