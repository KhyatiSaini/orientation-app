import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orientation_app/classes/posts.dart';
import 'package:orientation_app/utilities/map.dart';
import '../utilities/colors.dart';
class PostDetailScreen extends StatefulWidget {
  Post post;

  PostDetailScreen(this.post);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}


class _PostDetailScreenState extends State<PostDetailScreen> {
  String address = '';

  @override
  Widget build(BuildContext context) {
    String UserIcon() {
      List<String> name = widget.post.userName.split(" ");
      print(name);
      String a = "";
      for (String n in name) {
        a = a + n[0];
      }
      a = a.toUpperCase();
      if (a == "") {
        return "USER";
      }
      if(a.length >2){
        return a.substring(0,2);
      }
      return a;
    }

    DateTime dateTime = DateTime.parse(widget.post.timestamp);
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(18),
                child: Container(
                    child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colors[Random().nextInt(19)],
                    maxRadius: 25,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        child: Text(
                          UserIcon(),
                          style: const TextStyle(
                              fontSize: 40.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  title: Text(widget.post.userName),
                  subtitle: Text(dateTime.toString()),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: widget.post.imageUrl,
                          placeholder: (context, url) => Container(
                              height: 400,
                              child: Center(
                                  child: SpinKitCircle(
                                color: Colors.blue,
                                size: 60,
                              ))),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(18),
                child: Container(
                  child: Center(
                    child: Text(
                      widget.post.description,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(18),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: widget.post.location, zoom: 16),
                      markers: {
                        Marker(
                            markerId: MarkerId(widget.post.location.toString()),
                            position: widget.post.location)
                      },
                    ),
                  ),
                ),
              ),
              if (address != '')
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Container(
                    child: Text("Location  : " + address),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    locationAddress();
  }

  void locationAddress() async {
    String result = await LocationHelper.getPlaceAddress(
        widget.post.location.latitude, widget.post.location.longitude);
    print(result);
    setState(() {
      address = result;
    });
  }
}
