import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocData();
  }

  void getLocData() async {
    WeatherModel ob = WeatherModel();
    var weatherData = await ob.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293B4F),
      body: Center(
        child: SpinKitRotatingPlain(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
