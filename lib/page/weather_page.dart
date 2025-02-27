import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/weather_model.dart';
import 'package:flutter_tutorial/service/weather_service.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherServic = WeatherService('0dfbf1129185550108446af1d01a9996');
  Weather? _weather;

  _fetchweather() async {
    String cityName = await _weatherServic.getCurrentCity();
    try {
      final weather = await _weatherServic.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather?.CityName ?? "loading city..",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[300],
              ),
            ),

            // animation
            Lottie.asset(
              getWeatherAnimation(_weather?.mainCondition),
            ),

            const SizedBox(height: 10),

            Text(
              '${_weather?.temperature.round()}°C',
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey[300],
              ),
            ),

            Text(
              _weather?.mainCondition ?? "",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
