import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
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
    // if(_location == null){
    //   Fluttertoast.showToast(
    //       msg:
    //       "Please choose an location",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.white,
    //       textColor: Colors.redAccent,
    //       fontSize: 16.0);
    //   return;
    // }
    // if(_description == null){
    //   Fluttertoast.showToast(
    //       msg:
    //       "Please write a description",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.white,
    //       textColor: Colors.redAccent,
    //       fontSize: 16.0);
    //   return;
    // }
    final ref = FirebaseStorage.instance.ref().child('user-image').child(
        Random().nextInt(4294967296).toString() +
            Random().nextInt(4294967296).toString() +
            Random().nextInt(4294967296).toString() +
            Random().nextInt(4294967296).toString() +
            '.jpg');
    await ref.putFile(_image).onComplete;
    final url = await ref.getDownloadURL();
    print(url);

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
                            imageQuality: 50,
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
                            imageQuality: 50,
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
                                  builder: (ctx) => ChooseLocation(LatLng(
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
                          color: Theme.of(context).primaryColor),
                      label: Text(
                        "Choose Location",
                        style: TextStyle(color: Theme.of(context).primaryColor),
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
                    child: Text(
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
