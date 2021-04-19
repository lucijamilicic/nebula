import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import './aqiScreen.dart';
import './homeScreen.dart';


class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Stack(
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny_outlined),
            title: Text('Current weather',
              style: TextStyle(
                  fontSize: 25
              ),
            ),
            onTap: () {
              HomeScreen.displayText();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeScreen()
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud_outlined),
            title: Text('Air quality',
              style: TextStyle(
                  fontSize: 25
              ),
            ),
            onTap: () {
              AqiScreen.displayText();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AqiScreen()
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('Change location',
              style: TextStyle(
                  fontSize: 25
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