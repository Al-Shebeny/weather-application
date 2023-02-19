import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }

  // @override
  // String toString() {
  //   return 'temp = $temp date =$date';
  // }

  //used but the valu in the class must be null
  //so we do margin with factor constractor to avoide nulabel assinment value

  // WeatherModel.fromJson(dynamic data) {
  //   var jsonData = data['forecast']['forecastday'][0];
  //   date = data['location']['localtime'];
  //   temp = jsonData['avgtemp_c'];
  //   maxTemp = jsonData['maxtemp_c'];
  //   minTemp = jsonData['mintemp_c'];
  //   weatherStateName = jsonData['condition']['text'];
  // }
}
