import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_app/loadingData.dart';
import './mainDrawer.dart';
import 'package:flutter_app/weatherModel.dart';
import 'resizingScreens.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenn createState() => HomeScreenn();
}


class HomeScreenn extends State<HomeScreen>{
  // ? allows it to have null value so when we change its type from string to some object we dont have to change logic
  static WeatherInfo? _weatherInfo;
  static String? _dateFormatted;
  bool status = false;


  static Future<void> displayText () async {

    //http://api.openweathermap.org/data/2.5/weather?q=Belgrade&units=metric&appid=f89441c7a29b93afe60fb897a0e25cbc
    var url =
    Uri.https('api.openweathermap.org', '/data/2.5/weather', {'q' : UserData.city, 'units' : UserData.units, 'appid' : UserData.appid});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      WeatherInfo info = WeatherInfo.fromJson(jsonDecode(response.body));
      _weatherInfo = info;

      var now = DateTime.now();
      var formatter = DateFormat('dd.MM.yyyy.');
      _dateFormatted = formatter.format(now);

    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // configure aspect ratio depending on screen size
    SizeConfig.init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              'assets/${_weatherInfo?.getMain()}',
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: SizeConfig.blockSizeVertical! * 12,),
                            Text(
                              '${UserData.city}',
                              style: GoogleFonts.lato(
                                fontSize: 12*SizeConfig.blockSizeHorizontal!,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                              height: SizeConfig.blockSizeVertical!,
                            ),
                            Text(
                              _dateFormatted!,
                              style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_weatherInfo?.getTemp()}${UserData.c_or_f}',
                              style: GoogleFonts.lato(
                                fontSize: 55,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Feels like: ${_weatherInfo?.getFeelsLike()}${UserData.c_or_f}',
                                  style: GoogleFonts.lato(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                FlutterSwitch(
                                    value: UserData.status,
                                    activeText: '\u2109',
                                    activeTextColor: Colors.white,
                                    activeColor: Colors.cyan.shade900,
                                    inactiveText: '\u2103',
                                    inactiveColor: Colors.blueGrey,
                                    inactiveTextColor: Colors.white,
                                    valueFontSize: 15.0,
                                    width: 20 * SizeConfig.blockSizeHorizontal!,
                                    borderRadius: 30.0,
                                    showOnOff: true,
                                    onToggle: (val) async {
                                      setState(() {
                                        status = val;
                                      });
                                      await UserData.setUnits(status);
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen()
                                      ));
                                    }
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 40),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white30)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                  'Wind',
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,)
                              ),
                              Text(
                                  '${_weatherInfo?.getWindSpeed()}',
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,)
                              ),
                              Text(
                                  '${UserData.wind}',
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,)
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                  'Min temp',
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,)
                              ),
                              Text(
                                  '${_weatherInfo?.getMinTemp()}',
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,)
                              ),
                              Text(
                                  '${UserData.c_or_f}',
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,)
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                  'Max temp',
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,)
                              ),
                              Text(
                                  '${_weatherInfo?.getMaxTemp()}',
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,)
                              ),
                              Text(
                                  '${UserData.c_or_f}',
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,)
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
