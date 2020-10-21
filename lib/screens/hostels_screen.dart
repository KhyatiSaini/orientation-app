import 'package:flutter/material.dart';
import '../widgets/hostel_detail.dart';
class HostelsList extends StatefulWidget {
  static String route = "/hostels";
  @override
  _HostelsListState createState() => _HostelsListState();
}

class _HostelsListState extends State<HostelsList> {
  @override
  Widget build(BuildContext context) {
    var details = [
      {
        "url":
            "https://kinsta.com/wp-content/uploads/2017/04/change-wordpress-url-1.png",
        "title": "kbh",
        "description": "qaz wxv rjb mon lmlmml"
      },
      {
        "url":
            "https://kinsta.com/wp-content/uploads/2017/04/change-wordpress-url-1.png",
        "title": "kbh",
        "description": "qaz wxv rjb mon lmlmml"
      },
      {
        "url":
        "https://kinsta.com/wp-content/uploads/2017/04/change-wordpress-url-1.png",
        "title": "kbh",
        "description": "qaz wxv rjb mon lmlmml"
      },
      {
        "url":
        "https://kinsta.com/wp-content/uploads/2017/04/change-wordpress-url-1.png",
        "title": "kbh",
        "description": "qaz wxv rjb mon lmlmml"
      },
      {
        "url":
        "https://kinsta.com/wp-content/uploads/2017/04/change-wordpress-url-1.png",
        "title": "kbh",
        "description": "qaz wxv rjb mon lmlmml"
      },
      {
        "url":
        "https://kinsta.com/wp-content/uploads/2017/04/change-wordpress-url-1.png",
        "title": "kbh",
        "description": "qaz wxv rjb mon lmlmml"
      },
      {
        "url":
        "https://kinsta.com/wp-content/uploads/2017/04/change-wordpress-url-1.png",
        "title": "kbh",
        "description": "qaz wxv rjb mon lmlmml"
      },
      {
        "url":
        "https://kinsta.com/wp-content/uploads/2017/04/change-wordpress-url-1.png",
        "title": "kbh",
        "description": "qaz wxv rjb mon lmlmml"
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Hostels"),
      ),
      // navigation drawer
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return HostelDetailCard(details[i]["url"], details[i]["title"], details[i]["description"]);
          },
          itemCount: details.length,
        ),
      ),
    );
  }
}
