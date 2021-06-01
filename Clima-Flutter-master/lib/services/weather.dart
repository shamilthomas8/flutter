import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'ce4e0a913beadfa01901910d2b67c520';

class WeatherModel {
  Future getCityWeather(String cname) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cname&appid=$apikey&units=metric';

    Networkhelper networkhelper = Networkhelper(url);
    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Locationn loc = Locationn();
    await loc.getCurrentLoc();

    Networkhelper networkhelper = Networkhelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
