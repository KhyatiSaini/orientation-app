import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:orientation_app/providers/socities.dart';
import 'package:orientation_app/widgets/SocietyCard.dart';
import 'package:orientation_app/utilities/admanager.dart';
import 'package:provider/provider.dart';
class SocietyScreen extends StatefulWidget {
  static String route = "/societies-screen";
  @override
  _SocietyScreenState createState() => _SocietyScreenState();
}

class _SocietyScreenState extends State<SocietyScreen> {
  bool showSpinner = true;
  BannerAd myBanner;

  @override
  // ignore: must_call_super
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      showSpinner = true;
    });
    try {
      FirebaseAdMob.instance.initialize(appId: AdManager.appId);
      myBanner = buildBannerAd()..load();
    } catch (e) {
      print(e);
    }


    Future.delayed(Duration.zero).then((value) {
      Provider.of<Societies>(context, listen: false)
          .fetchAndSetSocieties()
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

  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-7983119257908874/2352824309",
        targetingInfo: MobileAdTargetingInfo(
            nonPersonalizedAds: true,
            testDevices: <String>["342425C960ED6562C9C5BB4BB8969CE2"]),
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner..show();
          }
        });
  }

  BannerAd buildLargeBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-7983119257908874/2352824309",
        size: AdSize.largeBanner,
        targetingInfo: MobileAdTargetingInfo(
            nonPersonalizedAds: true,
            testDevices: <String>["342425C960ED6562C9C5BB4BB8969CE2"]),
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner
              ..show(
                  anchorType: AnchorType.top,
                  anchorOffset: MediaQuery.of(context).size.height * 0.15);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    var details = Provider.of<Societies>(context).societies;
    List<Widget> getSocities() {
      List<Widget> Socities = [];
      print(details);
      for (int i = 0; i < details.length; i++) {
        Socities.add(SocietyCard(details[i]));
      }
      return Socities;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Societies"),
      ),
      // navigation drawer
      body: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: showSpinner
              ? Center(
              child: SpinKitWave(
                color: Colors.blue,
              ))
              : SingleChildScrollView(
            child: Column(
              children: getSocities(),
            ),
          )),
    );
  }
}
