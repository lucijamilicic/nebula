import 'dart:convert';

import 'package:flutter_app/screens/aqiScreen.dart';
import 'package:flutter_app/screens/homeScreen.dart';
import 'package:flutter_app/weatherModel.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserData {
  static String? city;
  static double? lat;
  static double? lon;
  static bool validLocation = true;
  static final  String appid = 'f89441c7a29b93afe60fb897a0e25cbc';
  static final String units = 'metric';


  /// this is for checking coordinates in console: test and debug
  //Belgrade:
  // var str = 'Belgrade';
  // double lat = 44.804;
  // double lon = 20.4651;

  //Pozarevac
  // var str = 'Pozarevac';
  // double lon = 21.1825;
  // double lat = 44.6153;

  //Tokio:
  // var str = 'Tokio';
  // double lat = 35.6895;
  // double lon = 139.6917;

  // Jakarta:
  // var str = 'Jakarta';
  // double lat = -6.2146;
  // double lon = 106.8451;

  //Stokholm:
  //var str = 'Stokholm';
  //double lat = 59.3326;
  //double lon = 18.0649;

  static saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', UserData.city ?? 'Belgrade');
    prefs.setDouble('lon', UserData.lon ?? 20.4651);
    prefs.setDouble('lat', UserData.lat ?? 44.804);

  }

  static Future<void> setLocation (String cityName) async {

    http://api.openweathermap.org/data/2.5/weather?q=Belgrade&units=metric&appid=f89441c7a29b93afe60fb897a0e25cbc
    var url =
    Uri.https('api.openweathermap.org', '/data/2.5/weather', {'q' : cityName, 'appid' : UserData.appid});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      WeatherInfo info = WeatherInfo.fromJson(jsonDecode(response.body));
      UserData.city = cityName;
      UserData.lon = info.coord.lon;
      UserData.lat = info.coord.lat;
      validLocation = true;
      saveData();
      await HomeScreen.displayText();
      await AqiScreen.displayText();
    } else {
      //this one is for debug only
      print('Request failed with status: ${response.statusCode}.\nInvalid input\n');
      validLocation = false;
    }
  }


}

