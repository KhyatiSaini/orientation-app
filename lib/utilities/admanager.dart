
import 'dart:io';

class AdManager{
  static String appId = "ca-app-pub-7983119257908874~6962470387";
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7983119257908874/2352824309";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }


}