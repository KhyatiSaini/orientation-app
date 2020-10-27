import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'Choose_location_screen.dart';
import '../utilities/location.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File _image;
  LatLng _location;
  String description;

  void uploadPost() {}

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
                          color: Theme.of(context).primaryColor,
                        ),
                        label: Text(
                          "Gallery",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20),
                        ),
                        onPressed: () async {
                          // ignore: deprecated_member_use
                          File file = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
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
                          color: Theme.of(context).primaryColor,
                          size: 40,
                        ),
                        label: Text(
                          "Camera",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20),
                        ),
                        onPressed: () async {
                          // ignore: deprecated_member_use
                          File file = await ImagePicker.pickImage(
                              source: ImageSource.camera);
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
                                  builder: (ctx) => ChooseLocation(LatLng(
                                      loc['latitude'], loc['longitude']))));

                          setState(() {
                            _location = markerposition;
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
                          color: Theme.of(context).primaryColor),
                      label: Text(
                        "Choose Location",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
