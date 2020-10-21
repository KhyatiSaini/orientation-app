import 'package:flutter/material.dart';

class HostelDetailCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  HostelDetailCard(this.imageUrl, this.title, this.description);

  @override
  _HostelDetailCardState createState() => _HostelDetailCardState();
}

class _HostelDetailCardState extends State<HostelDetailCard> {
  @override
  bool expand = false;

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(),
              title: Text(widget.title),
              trailing: IconButton(
                icon:
                    expand ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    expand = !expand;
                  });
                },
              ),
            ),
            if (expand == true)
              Container(
                width: double.infinity,
                height: 100,
                child: Column(
                  children: [
                    Title(
                        color: Colors.black,
                        child: Text(
                          "Description",
                          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                        )),
                    Center(
                      child: Text(widget.description),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
