import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transparent_image/transparent_image.dart';

class SportCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  SportCard(this.imageUrl, this.title, this.description);

  @override
  _SportCardState createState() => _SportCardState();
}

class _SportCardState extends State<SportCard> {
  @override
  bool expand = false;

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
              new Text(
                widget.title,
                style: TextStyle(fontSize: 30),
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
