import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
     GMSServices.provideAPIKey("AIzaSyD8mV2YNOuiucoiS39ARdXxbg8Rv7fSu9U")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
