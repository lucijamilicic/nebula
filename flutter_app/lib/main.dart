import 'package:flutter_app/screens/aqiScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './screens/homeScreen.dart';
import 'loadingData.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  UserData.saveData();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String str = prefs.getString('city') ?? '';
  double lon = prefs.getDouble('lon') ?? 0;
  double lat = prefs.getDouble('lat') ?? 0;

  //print(stringValue);


  /// this part will be in loading data func
  UserData.lon = lon;
  UserData.lat = lat;
  UserData.city = str;

  print(lon);
  print(lat);
  print(str);

  await HomeScreen.displayText();
  await AqiScreen.displayText();
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
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
