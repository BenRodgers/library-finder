import 'package:flutter/material.dart';
import 'package:libraryFinder/screens/home.dart';

import 'main.dart';

import 'package:flutter/material.dart';
import 'navbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Navbar extends StatelessWidget {

Future<Map<String,dynamic>> post(String url, String today, String hour, String minute) async {

  http.Response response = await http.post(Uri.encodeFull(url),
  headers: {
      "Content-Type": "application/json"
  }, 
  
  body: json.encode({"today": today, "hour": hour, "minute": minute}),
  
  encoding: Encoding.getByName("utf-8")
  );

  var data = json.decode(response.body);
  return data;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
              onPressed: () async {
                var res = await post('http://127.0.0.1:5000/', "Friday", DateTime.now().hour.toString(), DateTime.now().minute.toString());

                ScreenArguments screenArguments = new ScreenArguments(res['Architecture Music Library'], res['Biological Science Library'], res['Central Library'], res['Dorothy Hill Library'], res['Duhig Tower Library'], res['Walter Harrison Law Library'], res['day'], res['hour'], res['minute']);

                Navigator.push(context, MaterialPageRoute(
              builder: (context) => Home(screenArguments: screenArguments,),
            ));
              }, 
             child: Icon(Icons.home, color: Color.fromRGBO(73, 7, 95, 1), size: 40)),
          FlatButton(
              onPressed: () => Navigator.pushNamed(context, '/search'),
              child: Icon(Icons.schedule, color: Color.fromRGBO(73, 7, 95, 1))),
          FlatButton(
              onPressed: () => Navigator.pushNamed(context, '/information'),
              child: Icon(Icons.info, color: Color.fromRGBO(73, 7, 95, 1))),
        ],
      ),
    );
  }
}