import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../classes/posts.dart';


class Posts extends ChangeNotifier{
  List<Post> posts = [];
}