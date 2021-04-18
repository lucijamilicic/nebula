/// parsing json response:
//{"coord":{"lon":50,"lat":50},
// "list":[{"main":{"aqi":2},
//          "components":{"co":210.29,"no":0.05,
//                "no2":0.28,"o3":95.84,
//                "so2":0.52,"pm2_5":2.14,
//                "pm10":2.16,"nh3":0.19},
//          "dt":1618736400}]}


class Coord {
  double lon;
  double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
        lon: json['lon'] as double,
        lat: json['lat'] as double
    );
  }

  @override
  String toString() {
    return 'coordinates: lon = ${this.lon}, lat = ${this.lat}';
  }
}

class AirList {
  Map<String, dynamic> main;
  Map<String, dynamic> components;
  int dt;

  AirList({required this.main, required this.components, required this.dt});

  factory AirList.fromJson(Map<String, dynamic> json) {
    return AirList(
        main: json['main'],
        components: json['components'],
        dt: json['dt']
    );
  }


  @override
  String toString() {
    return 'aqi = ${this.main['aqi']}\ncomponents: ${this.components}\ndate and time stamp: ${this.dt}';
  }
}

class AirPollution {
  Coord coord;
  AirList list;

  AirPollution(this.coord, this.list);

  factory AirPollution.fromJson(Map<String, dynamic> json) {
    return AirPollution(
        Coord.fromJson(json['coord']),
        AirList.fromJson(json['list'][0])
    );
  }

  @override
  String toString() {
    return '${this.coord.toString()}\n${this.list.toString()}';
  }
}
