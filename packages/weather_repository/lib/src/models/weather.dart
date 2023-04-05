import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.location,
    required this.timeOffSet,
    required this.temperature,
    required this.windspeed,
    required this.condition,
    required this.humidity,
    required this.hourlyTime,
    required this.hourlyTemp,
    required this.pop,
    required this.hourlyWeatherCode,
    required this.dailyTime,
    required this.dailyWeathercode,
    required this.dailyTempMax,
    required this.dailyTempMin,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  final String location;
  final int timeOffSet;
  final double temperature;
  final double windspeed;
  final WeatherCondition condition;
  final int humidity;
  final List<int> hourlyTime;
  final List<double> hourlyTemp;
  final List<double> pop;
  final List<int> hourlyWeatherCode;
  final List<int> dailyTime;
  final List<int> dailyWeathercode;
  final List<double> dailyTempMax;
  final List<double> dailyTempMin;

  @override
  List<Object> get props => [
        location,
        timeOffSet,
        temperature,
        windspeed,
        condition,
        humidity,
        hourlyTime,
        hourlyTemp,
        pop,
        hourlyWeatherCode,
        dailyTime,
        dailyWeathercode,
        dailyTempMax,
        dailyTempMin,
      ];
}

enum WeatherCondition {
  clear,
  mostlyClear,
  rainy,
  heavyRain,
  thunderstorm,
  thunderstormWithHail,
  cloudy,
  partlyCloudy,
  snowy,
  unknown,
}
