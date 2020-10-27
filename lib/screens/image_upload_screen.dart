import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orientation_app/screens/home_screen.dart';
import 'package:orientation_app/utilities/constants.dart';
import 'Choose_location_screen.dart';
import '../utilities/location.dart';
import 'map.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File _image;
  LatLng _location;
  String _description;
  bool isUploading = false;
  void uploadPost() async {
    if (_image == null) {
      Fluttertoast.showToast(
          msg: "Please choose an image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.redAccent,
          fontSize: 16.0);
      return;
    }
    if (_location == null) {
      Fluttertoast.showToast(
          msg:
          "Please choose an location",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.redAccent,
          fontSize: 16.0);
      return;
    }
    if (_description == null) {
      Fluttertoast.showToast(
          msg:
          "Please write a description",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.redAccent,
          fontSize: 16.0);
      return;
    }
    try {
      setState(() {
        isUploading = true;
      });
      final ref = FirebaseStorage.instance.ref().child('user-image').child(
          Random().nextInt(4294967296).toString() +
              Random().nextInt(4294967296).toString() +
              Random().nextInt(4294967296).toString() +
              Random().nextInt(4294967296).toString() +
              '.jpg');
      await ref
          .putFile(_image)
          .onComplete;
      final url = await ref.getDownloadURL();
      var details = await FirebaseAuth.instance.currentUser;
      var payload = {
        'email': details.email,
        'userName': details.displayName,
        'imageUrl': url,
        'description': _description,
        'userId': details.uid,
        'latitude': _location.latitude,
        'longitude': _location.longitude
      };
      var data = jsonEncode(payload);
      var response = await post(baseUrl + '/uploadimage/', body: data, headers: {
        "content-type": "application/json"
      });
      print(jsonDecode(response.body));

      if (response.statusCode == 202) {
        print("Image Uploaded");
        Fluttertoast.showToast(
            msg:
            "Image was successfully uploaded",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
        setState(() {
          _image = null;
          _description = null;
          _location = null;
        });
        Navigator.of(context).pushNamed(HomeScreen.route);
      }
      else{
        throw Exception();
      }
    }
    catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg:
          "There was some error please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.redAccent,
          fontSize: 16.0);
    }

    setState(() {
      isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border()),
              child: Image(
                  image: _image != null
                      ? FileImage(_image)
                      : AssetImage('assets/images/back.jpg')),
            ),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton.icon(
                        color: Colors.white,
                        icon: Icon(
                          Icons.collections,
                          size: 40,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ),
                        label: Text(
                          "Gallery",
                          style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              fontSize: 20),
                        ),
                        onPressed: () async {
                          // ignore: deprecated_member_use
                          File file = await ImagePicker.pickImage(
                              imageQuality: 50, source: ImageSource.gallery);
                          setState(() {
                            _image = file;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton.icon(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Theme
                              .of(context)
                              .primaryColor,
                          size: 40,
                        ),
                        label: Text(
                          "Camera",
                          style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              fontSize: 20),
                        ),
                        onPressed: () async {
                          // ignore: deprecated_member_use
                          File file = await ImagePicker.pickImage(
                              imageQuality: 50, source: ImageSource.camera);
                          setState(() {
                            _image = file;
                          });
                        },
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                maxLines: 3,
                onChanged: (desc) {
                  _description = desc;
                },
                decoration: InputDecoration(labelText: "Description"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: FlatButton.icon(
                      onPressed: () async {
                        try {
                          Location location = new Location();
                          var loc = await location.getLocationLowAccuracy();
                          LatLng markerposition = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      ChooseLocation(LatLng(
                                          loc['latitude'], loc['longitude']))));

                          setState(() {
                            _location = markerposition != null
                                ? markerposition
                                : _location;
                          });
                          print(markerposition);
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg:
                              "There is some error please try again later.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.blue,
                              fontSize: 16.0);
                        }
                      },
                      icon: Icon(Icons.map,
                          color: Theme
                              .of(context)
                              .primaryColor),
                      label: Text(
                        "Choose Location",
                        style: TextStyle(color: Theme
                            .of(context)
                            .primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_location != null)
              Container(height: 400, child: Map(_location)),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: MaterialButton(
                    height: 48,
                    color: Colors.blue,
                    onPressed: () {
                      uploadPost();
                    },
                    child: isUploading ? SpinKitCircle(color: Colors.white): Text(
                      'Upload Post',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.white,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(17.0),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
