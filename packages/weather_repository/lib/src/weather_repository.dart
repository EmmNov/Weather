import 'dart:async';

import 'package:open_meteo_api/open_meteo_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

import 'models/weather.dart';

class WeatherRepository {
  WeatherRepository({OpenMeteoApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? OpenMeteoApiClient();

  final OpenMeteoApiClient _weatherApiClient;

  Future<Weather> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final weather = await _weatherApiClient.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    final hourlyTime = weather.hourly.map((hourly) => hourly.dt).toList();
    final hourlyTemp = weather.hourly.map((hourly) => hourly.temp).toList();
    final hourlyPop = weather.hourly.map((hourly) => hourly.pop).toList();
    final hourlyCondition = weather.hourly
        .map((hourly) => hourly.condition)
        .expand((element) => element)
        .map((condition) => condition.id)
        .toList();
    final dailyTime = weather.daily.map((daily) => daily.dt).toList();
    final dailyCondition = weather.daily
        .map((daily) => daily.condition)
        .expand((element) => element)
        .map((condition) => condition.id)
        .toList();
    final dailyTempMax = weather.daily.map((daily) => daily.temp.max).toList();
    final dailyTempMin = weather.daily.map((daily) => daily.temp.min).toList();

    return Weather(
      temperature: weather.current.temp,
      timeOffSet: weather.timezoneOffset,
      windspeed: weather.current.windSpeed,
      location: location.name,
      condition: weather.current.condition.first.id.toCondition,
      humidity: weather.current.humidity,
      pop: hourlyPop,
      hourlyTemp: hourlyTemp,
      hourlyTime: hourlyTime,
      hourlyWeatherCode: hourlyCondition,
      dailyTime: dailyTime,
      dailyWeathercode: dailyCondition,
      dailyTempMax: dailyTempMax,
      dailyTempMin: dailyTempMin,
    );
  }
}

extension on int {
  WeatherCondition get toCondition {
    switch (this) {
      case 800:
        return WeatherCondition.clear;
      case 801:
      case 802:
        return WeatherCondition.mostlyClear;
      case 803:
        return WeatherCondition.partlyCloudy;
      case 804:
        return WeatherCondition.cloudy;
      case 504:
      case 511:
      case 520:
      case 521:
      case 522:
      case 531:
        return WeatherCondition.heavyRain;
      case 200:
      case 201:
      case 202:
      case 210:
      case 211:
      case 212:
      case 221:
      case 230:
      case 231:
      case 323:
        return WeatherCondition.thunderstorm;
      case 96:
      case 99:
        return WeatherCondition.thunderstormWithHail;
      case 300:
      case 301:
      case 302:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 321:
      case 500:
      case 501:
      case 502:
      case 503:
        return WeatherCondition.rainy;
      case 600:
      case 601:
      case 602:
      case 611:
      case 612:
      case 613:
      case 615:
      case 616:
      case 620:
      case 621:
      case 622:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
