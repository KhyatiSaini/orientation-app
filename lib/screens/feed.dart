import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'post_detail_screen.dart';
import 'package:orientation_app/classes/posts.dart';
import 'package:orientation_app/utilities/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class UserPostsFeed extends StatefulWidget {
  @override
  _UserPostsFeedState createState() => _UserPostsFeedState();
}

class _UserPostsFeedState extends State<UserPostsFeed> {
  List<Post> posts = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchAndSetProducts();
  }

  void fetchAndSetProducts() async {
    try {
      Response response = await get(baseUrl + '/userposts/?format=json');
      var body = jsonDecode(response.body);
      int length = body.length;
      print(body);
      List<Post> Posts = [];
      for (int i = 0; i < length; i++) {
        Posts.add(Post(
            email: body[i]['userEmail'],
            imageUrl: body[i]['imageUrl'],
            description: body[i]['description'],
            timestamp: body[i]['timeOfUpload'],
            userName: body[i]['userName'],
            location: LatLng(double.parse(body[i]['latitude']),
                double.parse(body[i]['longitude']))));
      }
      setState(() {
        posts = Posts;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  List<Widget> getPosts() {
    List<Widget> postss = [];
    for (Post post in posts) {
      postss.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: 200,
                          child: Center(
                              child: SpinKitCircle(
                            color: Colors.blue,
                            size: 60,
                          ))),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PostDetailScreen(post)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Center(
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: post.imageUrl,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                    title: Text(post.userName),
                    subtitle:
                        Text(post.description, style: TextStyle(fontFamily: '')))
              ],
            ),
          ),
        ),
      ));
    }
    return postss;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SpinKitCircle(
              size: 50,
              color: Colors.blue,
            ),
          )
        : Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(children: getPosts()),
            ),
          );
  }
}
