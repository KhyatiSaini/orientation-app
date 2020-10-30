import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contributors extends StatelessWidget {
  static String route = "/contributors";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contributors"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/0.jpeg"),
                maxRadius: 55,
              ),
              SizedBox(height: 10),
              Text(
                "Mrigank Anand",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.github,
                      color: Color(0xFF211F1F),
                    ),
                    onPressed: () async {
                      const url = 'https://github.com/spiderxm';
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    iconSize: 45,
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Color(0xFF2867B2),
                    ),
                    onPressed: () async {
                      const url = 'https://www.linkedin.com/in/mrigankanand/';
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    iconSize: 45,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              CircleAvatar(
                maxRadius: 55,
                backgroundImage: AssetImage("assets/images/1.jpeg"),
              ),
              SizedBox(height: 10),
              Text(
                "Khyati Saini",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () async {
                      const url = 'https://github.com/KhyatiSaini';
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.black,
                    iconSize: 45,
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Color(0xFF2867B2),
                    ),
                    onPressed: () async {
                      const url =
                          'https://www.linkedin.com/in/khyati-saini-8769991a3/';
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.black,
                    iconSize: 45,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              CircleAvatar(
                maxRadius: 55,
                backgroundImage: AssetImage("assets/images/2.jpeg"),
              ),
              SizedBox(height: 10),
              Text(
                "Kriti Kinja",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () async {
                      const url = 'https://github.com/kritikinja';
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.black,
                    iconSize: 45,
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Color(0xFF2867B2),
                    ),
                    onPressed: () async {
                      const url =
                          'https://www.linkedin.com/in/kriti-kinja-157225193/';
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.black,
                    iconSize: 45,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
