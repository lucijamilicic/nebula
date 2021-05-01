import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static String? city;
  static double? lat;
  static double? lon;
  static final  String appid = 'f89441c7a29b93afe60fb897a0e25cbc';
  static final String units = 'metric';


  // TODO: Loading user data from input box and storing it
  //Belgrade:
  // var str = 'Belgrade';
  // double lat = 44.804;
  // double lon = 20.4651;

  //Pozarevac
  // var str = 'Pozarevac';
  // double lon = 21.1825;
  // double lat = 44.6153;

  //Tokio:
  // var str = 'Tokio';
  // double lat = 35.6895;
  // double lon = 139.6917;

  // Jakarta:
  // var str = 'Jakarta';
  // double lat = -6.2146;
  // double lon = 106.8451;

  //Stokholm:
  //var str = 'Stokholm';
  //double lat = 59.3326;
  //double lon = 18.0649;


  //TODO: implement storing user data with shared preferences
  static saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', "Belgrade");
    prefs.setDouble('lon', 20.4651);
    prefs.setDouble('lat', 44.804);

  }

}

