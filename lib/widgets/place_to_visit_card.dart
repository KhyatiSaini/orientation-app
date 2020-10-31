import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transparent_image/transparent_image.dart';

class PlaceToVisitCard extends StatefulWidget {
  String imageUrl;
  String name;
  String description;
  int distance;

  PlaceToVisitCard(this.imageUrl, this.name, this.description, this.distance);

  @override
  _PlaceToVisitCardState createState() => _PlaceToVisitCardState();
}

class _PlaceToVisitCardState extends State<PlaceToVisitCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: new Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                      height: 200,
                      child: Center(
                          child: SpinKitCircle(
                        color: Colors.blue,
                        size: 60,
                      ))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.imageUrl,
                        ),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Text(
                    widget.name,
                    style: TextStyle(fontSize: 30),
                  ),
                  Chip(label: Text(widget.distance.toString() + " km"))
                ],
              ),
              new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: Text(widget.description))
            ],
          ),
        ),
      ),
    );
  }
}
