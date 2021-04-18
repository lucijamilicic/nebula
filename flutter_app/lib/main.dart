import 'dart:convert';// as convert;
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

class ScreensData{
  String text;
  ScreensData(this.text);
}


void main() async {
  ScreensData scr = ScreensData('');

  // TODO: implement reading user data from file
  double lat = 44.804;
  double lon = 20.4651;
  UserData usr = UserData('Belgrade', lat, lon);

  // send http request to openweathermap:

  // http://api.openweathermap.org/data/2.5/weather?q=Belgrade&appid=f89441c7a29b93afe60fb897a0e25cbc
  // var url =
  //      Uri.https('api.openweathermap.org', '/data/2.5/weather', {'q' : 'Belgrade', 'appid' : 'f89441c7a29b93afe60fb897a0e25cbc'});

  //  http://api.openweathermap.org/data/2.5/air_pollution?lat=44.804&lon=20.4651&appid=f89441c7a29b93afe60fb897a0e25cbc
  var url =
    Uri.https('api.openweathermap.org', '/data/2.5/air_pollution', {'lat': '${usr.lat}', 'lon': '${usr.lon}', 'appid': usr.appid});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    AirPollution pollution = AirPollution.fromJson(jsonDecode(response.body));
    print(pollution);
    scr.text = pollution.toString();
  } else {
    print('Request failed with status: ${response.statusCode}.');
    scr.text = 'Request failed with status: ${response.statusCode}.';
  }

  runApp(MyApp(scr));

}
class MyApp extends StatelessWidget {
  ScreensData _screensData;
  MyApp(this._screensData);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(_screensData),
    );
  }
}
