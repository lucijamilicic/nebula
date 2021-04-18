import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import './mainDrawer.dart';

class AqiScreen extends StatelessWidget{
  ScreensData _screensData;
  AqiScreen(this._screensData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Air quality'),
      ),
      drawer: MainDrawer(_screensData),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(this._screensData.text,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

}