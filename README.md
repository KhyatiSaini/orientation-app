# Orientation App
A flutter application that will be like a companion for the freshers to get to know about the college, different clubs and socities here and many more things, and connect with batchmates and seniors via this app.

## User Authentication

## Backend - Firestore and Django
[Firestore](https://firebase.google.com/products/firestore) and [Django application](https://github.com/spiderxm/Orientation_app_backend) is used as backend for this application.

## Maps Section

## Using Google Maps


- To use Google Maps, a flutter plugin needs to be added as dependency in the ```pubspec.yaml``` file.
```
  dependencies:
    google_maps_flutter: ^0.5.27+3
```
- Get an API key at [https://cloud.google.com/maps-platform/](https://cloud.google.com/maps-platform/)
- <b>For Android</b>, Specify the API key in the android manifest ```android/app/src/main/AndroidManifest.xml```
```
  <manifest ...
    <application ...
        <meta-data
            android:name="com.google.android.geo.API_KEY"
            android:value="YOUR_API_KEY" />
```            
- <b>For iOS</b>, Specify the API key in the application delegate ```ios/Runner/AppDelegate.m```
```
  #include "AppDelegate.h"  
  #include "GeneratedPluginRegistrant.h"
  #import "GoogleMaps/GoogleMaps.h"

  @implementation AppDelegate

  - (BOOL)application:(UIApplication *)application
      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"YOUR KEY HERE"];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
  }
  @end
```
- Usage
```
 GoogleMap(
     mapType: MapType.normal,
     initialCameraPosition: _kGooglePlex,
     onMapCreated: (GoogleMapController controller) {
     _controller.complete(controller);
   },
 ),
```     

<strong>For more information refer</strong> [https://pub.dev/packages/google_maps_flutter](https://pub.dev/packages/google_maps_flutter)

## Other Sections

## Contributors Section
