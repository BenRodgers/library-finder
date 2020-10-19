import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';
import 'dart:convert';


Future<dynamic> post(String url, var body) async {
  
  var bodyEncoded = json.encode(body);  
  var response = await http.post(url, body: bodyEncoded , headers: {"Accept": "application/json"});
  final String res = response.body;
  
  return res;
}
