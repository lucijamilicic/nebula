import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import './screens/homeScreen.dart';

void main() async {
  runApp(MyApp());
  // send http request to openweathermap:
  // http://api.openweathermap.org/data/2.5/weather?q=Belgrade&appid=f89441c7a29b93afe60fb897a0e25cbc
  var url =
  Uri.https('api.openweathermap.org', '/data/2.5/weather', {'q' : 'Belgrade', 'appid' : 'f89441c7a29b93afe60fb897a0e25cbc'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
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
