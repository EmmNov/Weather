import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.location,
    required this.temperature,
    required this.windspeed,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  final String location;
  final double temperature;
  final double windspeed;
  final WeatherCondition condition;

  @override
  List<Object> get props => [
        location,
        temperature,
        windspeed,
        condition,
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
