import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../services/weather_services.dart';
import '../models/weather_model.dart';
import '../provider/weather_provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? cityName;
  //in the constrictor we use , this.updateUi
  //VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search A City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices services = WeatherServices();
              WeatherModel? weather =
                  await services.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
              //print(weather);
              //weatherData = weather;
              // updateUi!();
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              label: const Text('search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherServices services = WeatherServices();
                    WeatherModel? weather =
                        await services.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search_rounded)),
              border: OutlineInputBorder(),
              hintText: 'Enter City Name',
            ),
          ),
        ),
      ),
    );
  }
}

// WeatherModel? weatherData;
