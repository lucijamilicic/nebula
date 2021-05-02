import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import './mainDrawer.dart';
import 'package:flutter_app/airQualityModel.dart';
import 'package:flutter_app/loadingData.dart';
import 'package:flutter_app/screens/resizingScreens.dart';



class AqiScreen extends StatelessWidget{
  // ? allows it to have null value so when we change its type from string to some object we dont have to change logic
  static AirPollution? _airPollution;
  //static UserData? _userData;

  static Future<void> displayText() async {

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
      print(UserData.city.toString() + " " + UserData.lon.toString() + " " + UserData.lat.toString());

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

  }


  @override
  Widget build(BuildContext context) {
    // configure aspect ratio depending on screen size
    SizeConfig.init(context);

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.blockSizeVertical! * 10),
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
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      ]
                    ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      )


                ],
              )
            )
          ],
        ),
      ),
    );
  }

}