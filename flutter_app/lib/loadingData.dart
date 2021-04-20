//TODO: implement loading from file

import 'dart:async';
import 'dart:io';


class UserData {
  static String? city;
  static double? lat;
  static double? lon;
  static final  String appid = 'f89441c7a29b93afe60fb897a0e25cbc';

  static void loadFromFile() {
    File('resources/input.txt').readAsString().then((String contents) {
      print(contents);
    });
  }

}

