# Orientation App
A flutter application that will be like a companion for the freshers to get to know about the college, different clubs and societies here and many more things, and connect with batchmates and seniors via this app.

## User Authentication
[Firebase](https://firebase.google.com/) is used for user authenication. The user can either create an account or sign-in with google to continue with the app.

<img src = "https://user-images.githubusercontent.com/55757584/98590759-4aab3c00-22f5-11eb-8964-1e6225836d8f.jpg" width = "32%" height = "650px">    <img src = "https://user-images.githubusercontent.com/55757584/98591860-dd98a600-22f6-11eb-8d39-270ebd5fc511.jpg" width = "32%" height = "650px">    <img src = "https://user-images.githubusercontent.com/55757584/98592239-73cccc00-22f7-11eb-9120-0e8d87fda14a.jpg" width = "32%" height = "650px">

## Backend - Firestore and Django
[Firestore](https://firebase.google.com/products/firestore) and [Django application](https://github.com/spiderxm/Orientation_app_backend) is used as backend for this application.

## Maps Section
The google maps are used in these sections, markers are added at important places in the campus in a screen and in the other screen there are navigation options.
<p align = "center">
<img src = "https://user-images.githubusercontent.com/55757584/98593087-aaefad00-22f8-11eb-80d8-026046dae084.jpg" width = "30%">    <img src = "https://user-images.githubusercontent.com/55757584/98592892-6106c700-22f8-11eb-937f-aaa541007f53.jpg" width = "30%">
</p>
  

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

## Glimpse of Other Sections

<img src = "https://user-images.githubusercontent.com/55757584/98594229-6107c680-22fa-11eb-9b14-73b1a36aec42.jpg" width = "32%">    <img src = "https://user-images.githubusercontent.com/55757584/98593630-703a4480-22f9-11eb-920a-7ce7b20652f1.jpg" width = "32%">    <img src = "https://user-images.githubusercontent.com/55757584/98594564-df646880-22fa-11eb-870d-8f4da52a15b4.jpg" width = "32%">  
##
<img src = "https://user-images.githubusercontent.com/55757584/98594763-22264080-22fb-11eb-928f-882e74f4dda8.jpg" width = "32%" height = "678.5px">    <img src = "https://user-images.githubusercontent.com/55757584/98595042-76c9bb80-22fb-11eb-8fe9-e83283488228.jpg" width = "32%" height = "678.5px">    <img src = "https://user-images.githubusercontent.com/55757584/98595444-01121f80-22fc-11eb-9a19-040548eb3fd5.jpg" width = "32%" height = "678.5px">

##
<img src = "https://user-images.githubusercontent.com/55757584/98595740-60702f80-22fc-11eb-957e-da452aca4ed5.jpg" width = "32%">    <img src = "https://user-images.githubusercontent.com/55757584/98595853-931a2800-22fc-11eb-8db3-546a227adcf3.jpg" width = "32%">      <img src = "https://user-images.githubusercontent.com/55757584/98629729-866af380-233f-11eb-9487-f226ca494c72.jpg" width = "32%">

##
<img src = "https://user-images.githubusercontent.com/55757584/98596441-73cfca80-22fd-11eb-9186-b32b056f6691.jpg" width = "32%">    <img src = "https://user-images.githubusercontent.com/55757584/98596020-d70d2d00-22fc-11eb-90d7-81fc9a69ea14.jpg" width = "32%">    <img src = "https://user-images.githubusercontent.com/55757584/98596513-8cd87b80-22fd-11eb-9568-a2abdfbfed2e.jpg" width = "32%">

## Contributors Section

<p align = "center">
<img src = "https://user-images.githubusercontent.com/55757584/98596658-c14c3780-22fd-11eb-9e60-eadd5c07555a.jpg" width = "30%">
</p>
