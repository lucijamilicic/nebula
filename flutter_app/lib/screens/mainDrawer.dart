import 'package:flutter/material.dart';
import 'package:flutter_app/loadingData.dart';
import 'package:google_fonts/google_fonts.dart';

import '../loadingData.dart';
import './aqiScreen.dart';
import './homeScreen.dart';
import 'resizingScreens.dart';
import './changeLocation.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Theme.of(context).canvasColor,
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
          SizedBox(height: SizeConfig.blockSizeVertical! * 5),
          ListTile(
            leading: Icon(
              Icons.wb_sunny_outlined,
              color: Colors.white,
            ),
            title: Text('Current weather',
              style: GoogleFonts.lato(
                  fontSize: 25,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
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
            leading: Icon(
              Icons.cloud_outlined,
              color: Colors.white,
            ),
            title: Text('Air quality',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: Colors.white,
                //fontWeight: FontWeight.bold,
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
            leading: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            title: Text('Change location',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
                ChangeLocation.displayText();
                Navigator.push(context, MaterialPageRoute(
                builder: (context) => ChangeLocation()
                ));
                },
              // TODO: implement card for changing location
    //Navigator.pop(context); // close the drawer
          ),
        ],
      ),
    );
  }

}