import 'package:json_annotation/json_annotation.dart';
import 'hourly_weather.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  const Weather({
    required this.temperature,
    required this.weatherCode,
    required this.windspeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  final double temperature;
  @JsonKey(name: 'weathercode')
  final double weatherCode;
  final double windspeed;
}
