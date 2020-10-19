import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:libraryFinder/screens/FirstScreen.dart';
import 'package:libraryFinder/screens/Friday.dart';
import 'package:libraryFinder/screens/Information.dart';
import 'package:libraryFinder/screens/Library.dart';
import 'package:libraryFinder/screens/Search.dart';
import 'package:libraryFinder/screens/SecondScreen.dart';
import 'package:libraryFinder/screens/ThirdScreen.dart';
import 'navbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

import 'dart:async';
import 'dart:convert';
import 'screens/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Set<Marker> markers = Set();
var now = new DateTime.now();
var day = now.weekday;
var _value = 'Friday';

var image =  BitmapDescriptor.fromAssetImage(
  ImageConfiguration(),
  "assets/images/your_image.jpg",
);

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
      '/third': (context) => ThirdScreen(),
      '/home': (context) => Home(),
      '/information': (context) => Information(),
      '/search': (context) => Search(),
      '/friday': (context) => FridayScreen(),
      '/centralLibrary': (context) => CentralLibraryScreen(),
      '/duhigLibrary': (context) => DuhigLibraryScreen(),
      '/biolLibrary': (context) => BIOLLibraryScreen(),
      '/architectureLibrary': (context) => ArchitecureLibraryScreen(),
      '/lawLibrary': (context) => LawLibraryScreen(),
      '/dorothyHillLibrary': (context) => DorothyLibraryScreen(),
    },
  ));
}





