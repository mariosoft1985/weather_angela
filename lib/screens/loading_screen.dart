import 'package:flutter/material.dart';
import 'package:weather_angela/services/location.dart';
import 'package:weather_angela/services/networking.dart';

const apiKey = 'aaacaa5c294234485a3ab3880cee9bab';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    String cityName = weatherData['name'];
    print(cityName);

    int temp = weatherData['main']['temp'];
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
