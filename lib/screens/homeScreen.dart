import 'package:flutter/material.dart';
import './detailsScreen.dart';
import './mainDrawer.dart';


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('this is home page',
              style: TextStyle(
                fontSize: 22,
              ),),
            RaisedButton(
              child: Text('see details'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailsScreen()
                ));
              },
            )
          ],
        ),
      ),
    );
  }

}