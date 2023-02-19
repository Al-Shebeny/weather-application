import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherServices {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = '6f696f713791410eb1b231428230902';
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
    //awy to use data without json constractor but
    // var jsonData = data['forecast']['forecastday'][0];
    // WeatherModel weather = WeatherModel(
    //     date: data['location']['localtime'],
    //     temp: jsonData['avgtemp_c'],
    //     maxTemp: jsonData['maxtemp_c'],
    //     minTemp: jsonData['mintemp_c'],
    //     weatherStateName: jsonData['condition']['text']);

    //print(data);
    // String date = data['location']['localtime'];
    // String temp = data['forecast']['forecastday'][0]['"avgtemp_c'];
  }
}
