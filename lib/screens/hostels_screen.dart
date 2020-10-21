import 'package:flutter/material.dart';
import 'package:orientation_app/providers/hostels.dart';
import 'package:provider/provider.dart';
import '../widgets/hostel_detail.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HostelsList extends StatefulWidget {
  static String route = "/hostels";

  @override
  _HostelsListState createState() => _HostelsListState();
}

class _HostelsListState extends State<HostelsList> {
  bool showSpinner = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      showSpinner = true;
    });
    Future.delayed(Duration.zero).then((value) {
      Provider.of<Hostels>(context, listen: false)
          .fetchAndSetHostels()
          .then((value) {
        setState(() {
          showSpinner = false;
        });
      }).catchError((error) async {
        setState(() {
          showSpinner = false;
        });
        await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('There was some error please try again later.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        Navigator.of(context).pop();
      });
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
        child: showSpinner
            ? Center(
                child: SpinKitFadingFour(
                color: Colors.black,
              ))
            : ListView.builder(
                itemBuilder: (ctx, i) {
                  return HostelDetailCard(details[i].imageUrl,
                      details[i].hostelName, details[i].description);
                },
                itemCount: details.length,
              ),
      ),
    );
  }
}
