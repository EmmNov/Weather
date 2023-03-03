import 'package:json_annotation/json_annotation.dart';

part 'hourly_weather.g.dart';

@JsonSerializable()
class Hourly {
  Hourly(
      {required this.time,
      required this.temperature,
      required this.humidity,
      required this.precipitation,
      required this.weatherCode});

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  final List<String> time;
  @JsonKey(name: 'temperature_2m')
  final List<double> temperature;
  @JsonKey(name: 'relativehumidity_2m')
  final List<int> humidity;
  @JsonKey(name: 'precipitation_probability')
  final List<int> precipitation;
  @JsonKey(name: 'weathercode')
  final List<int> weatherCode;
}
