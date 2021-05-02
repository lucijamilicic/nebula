import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'aqiScreen.dart';
import './mainDrawer.dart';
import 'package:flutter_app/airQualityModel.dart';
import 'package:flutter_app/loadingData.dart';
import 'package:flutter_app/screens/resizingScreens.dart';


import 'package:flutter_app/loadingData.dart';
import './mainDrawer.dart';
import 'package:flutter_app/weatherModel.dart';
import 'resizingScreens.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({Key? key}) : super(key: key);

  @override
  ChangeLocationn createState() => ChangeLocationn();
}

/// This is the private State class that goes with MyStatefulWidget.
class ChangeLocationn extends State<ChangeLocation> {

  static AirPollution? _airPollution;

  static Future<void> displayText() async {
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

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              'assets/location.jpg',
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
                          'Enter location: ',
                          style: GoogleFonts.lato(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 5),
                        TextField(
                          style:TextStyle(
                            color:Colors.white
                          ),
                          obscureText: true,
                          autofocus: true,
                          controller: _controller,
                          onSubmitted: (String value) async {
                            await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Thanks!'),
                                  content: Text(_controller.text),
                                    /*
                                      'You typed "$value", which has length ${value
                                          .characters.length}.'),*/
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        UserData.city = _controller.text;
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter a new location',
                            labelStyle:TextStyle(
                              decorationColor: Colors.white,
                              color: Colors.white
                            ),
                            hintText: '________________',
                            hintStyle: TextStyle(
                              color:Colors.white
                            ),
                          ),
                        )
                      ]

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
