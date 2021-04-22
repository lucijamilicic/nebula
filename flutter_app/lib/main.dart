import 'package:flutter_app/screens/aqiScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './screens/homeScreen.dart';
import 'loadingData.dart';


void main() async {

  // TODO: Loading user data from input box and storing it
  //Belgrade:
  var str = 'Belgrade';
  double lat = 44.804;
  double lon = 20.4651;

  //Pozarevac
  // var str = 'Pozarevac';
  // double lon = 21.1825;
  // double lat = 44.6153;

  //Tokio:
  // var str = 'Tokio';
  // double lat = 35.6895;
  // double lon = 139.6917;

  Jakarta:
   // var str = 'Jakarta';
   // double lat = -6.2146;
   // double lon = 106.8451;

  //Stokholm:
  //var str = 'Stokholm';
  //double lat = 59.3326;
  //double lon = 18.0649;

  // UserData usr = UserData(str, lat, lon);
  // _userData = usr;

  /// this part will be in loading data func
  UserData.lon = lon;
  UserData.lat = lat;
  UserData.city = str;


  await HomeScreen.displayText();
  await AqiScreen.displayText();
  runApp(MyApp());

  UserData.saveCity();

  SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
  String stringValue = prefs.getString('city') ?? '';

  //print(stringValue);

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: Colors.white10,
      ),
      home: HomeScreen(),
    );
  }
}
