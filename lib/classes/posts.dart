import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Post {
  String email;
  String description;
  String imageUrl;
  String userName;
  LatLng location;
  String timestamp;

  Post(
      {this.email,
        this.description,
      this.imageUrl,
      this.userName,
      this.location,
      this.timestamp});
}
