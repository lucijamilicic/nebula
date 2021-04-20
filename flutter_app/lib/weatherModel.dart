///parsing json response in format:
//{"coord":{"lon":20.4651,"lat":44.804},
// "weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],
// "base":"stations",
// "main":{"temp":11.59,"feels_like":10.79,"temp_min":11,"temp_max":13,"pressure":1014,"humidity":76},
// "visibility":10000,
// "wind":{"speed":1.03,"deg":0},
// "clouds":{"all":40},
// "dt":1618928402,
// "sys":{"type":1,"id":7028,"country":"RS","sunrise":1618890301,"sunset":1618939719},
// "timezone":7200,
// "id":792680,
// "name":"Belgrade",
// "cod":200}

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

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({required this.id, required this.main, required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']
    );
  }

  @override
  String toString() {
    return 'weather: id = ${this.id}, main = ${this.main}, description =${this.description}, icon =${this.icon}';
  }
}

// "main":{"temp":11.59,"feels_like":10.79,"temp_min":11,"temp_max":13,"pressure":1014,"humidity":76},
class WMain {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  int pressure;
  int humidity;

  WMain({required this.temp, required this.feels_like, required this.temp_min, required this.temp_max, required this.pressure, required this.humidity});

  factory WMain.fromJson(Map<String, dynamic> json) {
    return WMain(
        temp: json['temp'],
        feels_like: json['feels_like'],
        temp_min: json['temp_min'],
        temp_max: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity']
    );
  }

  @override
  String toString() {
    return 'main: temp = ${this.temp}, feels_like = ${this.feels_like}, temp_min =${this.temp_min}, temp_max =${this.temp_max}, pressure = ${this.pressure}, humidity = ${this.humidity}';
  }
}

class Wind {
  double speed;
  int deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
        speed: json['speed'],
        deg: json['deg']
    );
  }

  @override
  String toString() {
    return 'wind: speed = ${this.speed}, deg = ${this.deg}';
  }
}

class Clouds {
  int all;

  Clouds({required this.all});

  factory Clouds.fromJson(dynamic json) {
    return Clouds(
        all: json['all']
    );
  }

  @override
  String toString() {
    return 'clouds: all =${this.all}';
  }
}

class Sys {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  Sys({required this.type, required this.id, required this.country, required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
        type: json['type'],
        id: json['id'],
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset']
    );
  }

  @override
  String toString() {
    return 'sys: type = ${this.type}, id = ${this.id}, country =${this.country}, sunrise =${this.sunrise}, sunset = ${this.sunset}';
  }
}

class WeatherInfo {
  Coord coord;
  Weather weather;
  String base;
  WMain wmain;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  // WeatherInfo({required this.coord, required this.weather, required this.base, required this.wmain, required this.visibility,
  // required this.wind, required this.clouds, required this.dt, required this.sys, required this.timezone, required this.id, required this.name, required this.cod});

  WeatherInfo(this.coord, this.weather, this.wmain, this.wind, this.clouds,
      this.sys,
      {required this.base, required this.visibility, required this.dt, required this.timezone, required this.id, required this.name, required this.cod});


  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        Coord.fromJson(json['coord']),
        Weather.fromJson(json['weather'][0]),
        WMain.fromJson(json['main']),
        Wind.fromJson(json['wind']),
        Clouds.fromJson(json['clouds']),
        Sys.fromJson(json['sys']),
        base: json['base'] as String,
        visibility: json['visibility'] as int,
        dt: json['dt'] as int,
        timezone: json['timezone'] as int,
        id: json['id'] as int,
        name: json['name'] as String,
        cod: json['cod'] as int
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'radi';
  }

}