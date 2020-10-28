import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:orientation_app/classes/club.dart';
import 'package:transparent_image/transparent_image.dart';

class ClubCard extends StatefulWidget {
  Club club;

  ClubCard(this.club);

  @override
  _ClubCardState createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Card(
            child: new Column(
              children: <Widget>[
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                          height: 200,
                          child: Center(
                              child: SpinKitCircle(
                            color: Colors.blue,
                            size: 60,
                          ))),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Center(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                            image: widget.club.imageUrl,
                          ),
                        ))
                  ],
                ),
                new Text(
                  widget.club.clubName,
                  style: TextStyle(fontSize: 30),
                ),
                new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: Text(widget.club.description)),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text("President",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                            "Vice President",
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        child: CircleAvatar(
                          maxRadius: 50,
                          backgroundImage:
                              NetworkImage(widget.club.president.imageUrl),
                        ),
                        maxRadius: 53,
                        backgroundColor: Colors.blue,
                      ),
                      CircleAvatar(
                        child: CircleAvatar(
                          maxRadius: 50,
                          backgroundImage:
                              NetworkImage(widget.club.vicePresident.imageUrl),
                        ),
                        maxRadius: 53,
                        backgroundColor: Colors.blue,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              widget.club.president.name,
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
                            )),
                          )),
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(widget.club.vicePresident.name,
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300)),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
