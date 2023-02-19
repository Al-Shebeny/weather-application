import 'package:flutter/material.dart';
import 'package:flutter_application_1787/models/weather_model.dart';
import 'package:provider/provider.dart';
import '../provider/weather_provider.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(
                            // updateUi: updateUi,
                            )));
              },
              icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    weatherData.getThemeColor(),
                    weatherData.getThemeColor()[300]!,
                    weatherData.getThemeColor()[100]!,
                  ])),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Update at : ${weatherData.date.hour} : ${weatherData.date.minute}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData.getImage()),
                      Text(
                        '${weatherData.temp.toInt()}',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'maxTemp : ${weatherData.maxTemp.toInt()}',
                          ),
                          Text(
                            'minTemp : ${weatherData.minTemp.toInt()}',
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData.weatherStateName,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 5),
                ],
              ),
            ),
    );
  }
}
