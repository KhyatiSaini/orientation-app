import 'package:flutter/material.dart';
import 'package:orientation_app/providers/hostels.dart';
import 'package:provider/provider.dart';
import '../widgets/hostel_detail.dart';

class HostelsList extends StatefulWidget {
  static String route = "/hostels";

  @override
  _HostelsListState createState() => _HostelsListState();
}

class _HostelsListState extends State<HostelsList> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((value) {
      Provider.of<Hostels>(context, listen: false).fetchAndSetHostels();
    });
  }

  @override
  Widget build(BuildContext context) {
    var details = Provider.of<Hostels>(context).hostels;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hostels"),
      ),
      // navigation drawer
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return HostelDetailCard(details[i].imageUrl, details[i].hostelName,
                details[i].description);
          },
          itemCount: details.length,
        ),
      ),
    );
  }
}
