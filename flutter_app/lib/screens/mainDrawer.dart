import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import './aqiScreen.dart';
import './homeScreen.dart';


class MainDrawer extends StatelessWidget {
  ScreensData _screensData;
  MainDrawer(this._screensData);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepOrangeAccent
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny_outlined),
            title: Text('Current weather',
              style: TextStyle(
                  fontSize: 22
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeScreen(_screensData)
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud_outlined),
            title: Text('Air quality',
              style: TextStyle(
                  fontSize: 22
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AqiScreen(_screensData)
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Change location',
              style: TextStyle(
                  fontSize: 22
              ),
            ),
            onTap: () {
              // TODO: implement card for changing location
            },
          ),
        ],
      ),
    );
  }

}