import 'package:flutter/material.dart';
import './detailsScreen.dart';
import './homeScreen.dart';


class MainDrawer extends StatelessWidget {
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
                        color: Colors.lightBlueAccent
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Home',
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailsScreen()
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Location',
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeScreen()
              ));
            },
          ),
        ],
      ),
    );
  }

}