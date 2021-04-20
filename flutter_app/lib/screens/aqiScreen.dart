import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import './mainDrawer.dart';
import 'package:flutter_app/airQualityModel.dart';
import 'dart:convert';
import 'package:flutter_app/loadingData.dart';



class AqiScreen extends StatelessWidget{
  // ? allows it to have null value so when we change its type from string to some object we dont have to change logic
  static AirPollution? _airPollution;
  //static UserData? _userData;

  static void displayText() async {

    // TODO: Loading user data from file
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

    Jakarta:
    // var str = 'Jakarta';
    // double lat = -6.2146;
    // double lon = 106.8451;

    Stokholm:
    var str = 'Stokholm';
    double lat = 59.3326;
    double lon = 18.0649;

    // UserData usr = UserData(str, lat, lon);
    // _userData = usr;

    /// this part will be in file reading func
    UserData.lon = lon;
    UserData.lat = lat;
    UserData.city = str;

    // send http request
    // api.openweathermap.org/data/2.5/air_pollution?lat=44.804&lon=20.4651&appid=f89441c7a29b93afe60fb897a0e25cbc

    var url =
    Uri.https('api.openweathermap.org', '/data/2.5/air_pollution', {'lat': '${UserData.lat}', 'lon': '${UserData.lon}', 'appid': UserData.appid});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      AirPollution pollution = AirPollution.fromJson(jsonDecode(response.body));
      // print(pollution);
      _airPollution = pollution;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/${_airPollution?.getAqi()}.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120,),
                  Text(
                    '${UserData.city}',
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${_airPollution?.getAqiFormated()}',
                    style: GoogleFonts.lato(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '(Air quality index: ${_airPollution?.getAqi()})',
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 250,),
                  Text(
                    'Components',
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${_airPollution?.getComponentsFormated()}',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
                  )
            )
          ],
        ),
      ),
    );
  }

}