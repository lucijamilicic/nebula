import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './mainDrawer.dart';
import 'package:flutter_app/loadingData.dart';
import 'package:flutter_app/screens/resizingScreens.dart';
import 'resizingScreens.dart';
import './homeScreen.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({Key? key}) : super(key: key);

  @override
  ChangeLocationn createState() => ChangeLocationn();
}

/// This is the private State class that goes with MyStatefulWidget.
class ChangeLocationn extends State<ChangeLocation> {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                        SizedBox(height: SizeConfig.blockSizeVertical! * 15),
                        Text(
                          'Enter location: ',
                          style: GoogleFonts.lato(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 5),
                        TextField(
                          style: GoogleFonts.lato(
                            color:Colors.white,
                            fontSize: 22,
                          ),
                          autofocus: true,
                          controller: _controller,
                          onSubmitted: (String value) async {
                            await UserData.setLocation(_controller.text.length > 0 ? "${_controller.text[0].toUpperCase()}${_controller.text.substring(1)}" : " ");
                            Navigator.pop(context);
                            if(UserData.validLocation){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => HomeScreen()
                              ));
                            }
                            else {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ChangeLocation()
                              ));
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: UserData.validLocation ? 'Enter a new location' : 'Invalid location, try again',
                            labelStyle: GoogleFonts.lato(
                              decorationColor: Colors.white,
                              color: Colors.white
                            ),
                            hintStyle: TextStyle(
                              color:Colors.white
                            ),
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
}
