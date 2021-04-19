import 'dart:convert';// as convert;
import 'package:flutter_app/screens/aqiScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import './screens/homeScreen.dart';
import './airQualityModel.dart';

class UserData {
  String city;
  double lat;
  double lon;
  final String appid = 'f89441c7a29b93afe60fb897a0e25cbc';

  UserData(this.city, this.lat, this.lon);

  // FIXME: this should probably be a separate file
}


void main() async {
  HomeScreen.displayText();
  AqiScreen.displayText();
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
    );
  }
}
