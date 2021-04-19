import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import './mainDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';



class HomeScreen extends StatelessWidget{
  // ? allows it to have null value so when we change its type from string to some object we dont have to change logic
  static String? _displayText;

  static void displayText () async {

    // TODO: Loading user data from file

    //Belgrade:
    // double lat = 44.804;
    // double lon = 20.4651;

    //Tokio:
    double lat = 35.6895;
    double lon = 139.6917;
    UserData usr = UserData('Belgrade', lat, lon);

    http://api.openweathermap.org/data/2.5/weather?q=Belgrade&appid=f89441c7a29b93afe60fb897a0e25cbc
    var url =
         Uri.https('api.openweathermap.org', '/data/2.5/weather', {'q' : usr.city, 'appid' : usr.appid});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      HomeScreen._displayText = response.body;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      HomeScreen._displayText = 'Request failed with status: ${response.statusCode}.';
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
              'assets/snow.jpeg',
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
                  children: [
                    SizedBox(height: 120,),
                    Text(
                      'Belgrade',
                      style: GoogleFonts.lato(
                        fontSize: 35,
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