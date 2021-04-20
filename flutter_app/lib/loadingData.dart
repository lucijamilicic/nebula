import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static String? city;
  static double? lat;
  static double? lon;
  static final  String appid = 'f89441c7a29b93afe60fb897a0e25cbc';

  //TODO: implement storing user data with shared preferences
  static saveCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', "Belgrade");
  }

}

