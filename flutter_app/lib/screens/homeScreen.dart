import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import './mainDrawer.dart';


class HomeScreen extends StatelessWidget{
  ScreensData _screensData;
  HomeScreen(this._screensData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current weather'),
      ),
      drawer: MainDrawer(_screensData),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Here should be daily forecast',
              style: TextStyle(
                fontSize: 22,
              ),),
          ],
        ),
      ),
    );
  }
}