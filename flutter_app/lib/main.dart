import 'dart:convert';// as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import './screens/homeScreen.dart';

// jsonResponse example:
//{"coord":{"lon":50,"lat":50},
// "list":[{"main":{"aqi":2},
//          "components":{"co":210.29,"no":0.05,
//                "no2":0.28,"o3":95.84,
//                "so2":0.52,"pm2_5":2.14,
//                "pm10":2.16,"nh3":0.19},
//          "dt":1618736400}]}

//    return AirPollution.fromJson(jsonDecode(response.body));

class Coord {
  double lon;
  double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
        lon: json['lon'] as double,
        lat: json['lat'] as double
    );
  }

  @override
  String toString() {
    return 'coordinates: lon = ${this.lon}, lat = ${this.lat}';
  }
}

class AirList {
  Map<String, dynamic> main;
  Map<String, dynamic> components;
  int dt;

  AirList({required this.main, required this.components, required this.dt});

  factory AirList.fromJson(Map<String, dynamic> json) {
    return AirList(
        main: json['main'],
        components: json['components'],
        dt: json['dt']
    );
  }


  @override
  String toString() {
    return 'aqi = ${this.main['aqi']}\ncomponents: ${this.components}\ndate and time stamp: ${this.dt}';
  }
}

class AirPollution {
  Coord coord;
  AirList list;

  AirPollution(this.coord, this.list);

  factory AirPollution.fromJson(Map<String, dynamic> json) {
    return AirPollution(
        Coord.fromJson(json['coord']),
        AirList.fromJson(json['list'][0])
    );
  }

  @override
  String toString() {
    return '${this.coord.toString()}\n${this.list.toString()}';
  }
}

void main() async {
  runApp(MyApp());
  // send http request to openweathermap:

  // http://api.openweathermap.org/data/2.5/weather?q=Belgrade&appid=f89441c7a29b93afe60fb897a0e25cbc
  // var url =
  //      Uri.https('api.openweathermap.org', '/data/2.5/weather', {'q' : 'Belgrade', 'appid' : 'f89441c7a29b93afe60fb897a0e25cbc'});

  //  http://api.openweathermap.org/data/2.5/air_pollution?lat=44.804&lon=20.4651&appid=f89441c7a29b93afe60fb897a0e25cbc
  var url =
    Uri.https('api.openweathermap.org', '/data/2.5/air_pollution', {'lat': '44.804', 'lon': '20.4651', 'appid': 'f89441c7a29b93afe60fb897a0e25cbc'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    AirPollution pollution = AirPollution.fromJson(jsonDecode(response.body));
    print(pollution);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeScreen(),
    );
  }
}
