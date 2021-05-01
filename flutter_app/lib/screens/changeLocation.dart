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

}