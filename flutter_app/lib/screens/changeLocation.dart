import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter_app/loadingData.dart';
import './mainDrawer.dart';
import 'package:flutter_app/weatherModel.dart';
import 'resizingScreens.dart';


class ChangeLocation extends StatelessWidget {

  static Future<void> displayText() async {
    print('zaaaaastava');
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
                              obscureText: true,
                              autofocus: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter a new location',
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

/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Change Location'),
          ),
          body: Center(child: Column(children: <Widget>[
          Container(
          margin: EdgeInsets.all(25),
              child:TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () { },
                child: Text('TextButton'),
              )

          ),
          Container(
          margin: EdgeInsets.all(25),
          child:TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () { },
            child: Text('Ranicu se'),
          )
          ),
          ]
          ))
      ),
    );
  }
  */
}