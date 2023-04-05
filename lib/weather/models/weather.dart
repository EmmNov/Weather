import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import 'package:weather_app/weather/extention.dart';
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.condition,
    required this.lastUpdated,
    required this.location,
    required this.timeZoneOffSet,
    required this.temperature,
    required this.windspeed,
    required this.humidity,
    required this.pop,
    required this.hourlyTime,
    required this.hourlyTemp,
    required this.hourlyWeatherCode,
    required this.dailyTime,
    required this.dailyWeatherCode,
    required this.dailyTempMax,
    required this.dailyTempMin,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      condition: weather.condition,
      lastUpdated: DateTime.now(),
      location: weather.location,
      timeZoneOffSet: weather.timeOffSet,
      temperature: Temperature(value: weather.temperature),
      windspeed: Windspeed(value: weather.windspeed),
      humidity: weather.humidity,
      pop: weather.pop,
      hourlyTemp: weather.hourlyTemp,
      hourlyTime: weather.hourlyTime,
      hourlyWeatherCode: weather.hourlyWeatherCode,
      dailyTime: weather.dailyTime,
      dailyWeatherCode: weather.dailyWeathercode,
      dailyTempMax: weather.dailyTempMax,
      dailyTempMin: weather.dailyTempMin,
    );
  }

  static final empty = Weather(
    condition: WeatherCondition.unknown,
    lastUpdated: DateTime(0),
    timeZoneOffSet: 0,
    temperature: const Temperature(value: 0),
    windspeed: const Windspeed(value: 0),
    location: '--',
    humidity: 0,
    pop: const [0.0],
    hourlyTemp: const [0.0],
    hourlyTime: const [0],
    hourlyWeatherCode: const [0],
    dailyTime: const [0],
    dailyWeatherCode: const [0],
    dailyTempMax: const [0.0],
    dailyTempMin: const [0.0],
  );

  final WeatherCondition condition;
  final DateTime lastUpdated;
  final String location;
  final int timeZoneOffSet;
  final Temperature temperature;
  final Windspeed windspeed;
  final int humidity;
  final List<int> hourlyTime;
  final List<double> hourlyTemp;
  final List<double> pop;
  final List<int> hourlyWeatherCode;
  final List<int> dailyTime;
  final List<int> dailyWeatherCode;
  final List<double> dailyTempMax;
  final List<double> dailyTempMin;

  @override
  List<Object> get props => [
        condition,
        lastUpdated,
        location,
        timeZoneOffSet,
        temperature,
        windspeed,
        humidity,
        pop,
        hourlyTemp,
        hourlyTime,
        hourlyWeatherCode,
        dailyTime,
        dailyWeatherCode,
        dailyTempMax,
        dailyTempMin
      ];

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  Weather copyWith({
    WeatherCondition? condition,
    DateTime? lastUpdated,
    String? location,
    int? timeZoneOffSet,
    Temperature? temperature,
    Windspeed? windspeed,
    int? humidity,
    List<double>? pop,
    List<int>? hourlyTime,
    List<double>? hourlyTemp,
    List<int>? hourlyWeatherCode,
    List<int>? dailyTime,
    List<int>? dailyWeatherCode,
    List<double>? dailyTempMax,
    List<double>? dailyTempMin,
  }) {
    return Weather(
        condition: condition ?? this.condition,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        location: location ?? this.location,
        timeZoneOffSet: timeZoneOffSet ?? this.timeZoneOffSet,
        temperature: temperature ?? this.temperature,
        windspeed: windspeed ?? this.windspeed,
        humidity: humidity ?? this.humidity,
        pop: pop ?? this.pop,
        hourlyTemp: hourlyTemp ?? this.hourlyTemp,
        hourlyTime: hourlyTime ?? this.hourlyTime,
        hourlyWeatherCode: hourlyWeatherCode ?? this.hourlyWeatherCode,
        dailyTime: dailyTime ?? this.dailyTime,
        dailyWeatherCode: dailyWeatherCode ?? this.dailyWeatherCode,
        dailyTempMax: dailyTempMax ?? this.dailyTempMax,
        dailyTempMin: dailyTempMin ?? this.dailyTempMin);
  }
}

enum TemperatureUnits { fahrenheit, celsius }

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

enum WindspeedUnits { ms, mph }

extension WindspeedUnitsX on WindspeedUnits {
  bool get isMs => this == WindspeedUnits.ms;
  bool get isMph => this == WindspeedUnits.mph;
}

@JsonSerializable()
class Temperature extends Equatable {
  const Temperature({required this.value});

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  final double value;

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  @override
  List<Object> get props => [value];
}

@JsonSerializable()
class Windspeed extends Equatable {
  const Windspeed({required this.value});

  factory Windspeed.fromJson(Map<String, dynamic> json) =>
      _$WindspeedFromJson(json);

  final double value;

  Map<String, dynamic> toJson() => _$WindspeedToJson(this);

  @override
  List<Object?> get props => [value];
}

extension Units on Weather {
  String formattedTemperature(TemperatureUnits units) {
    return '''${temperature.value.toInt()}\u00B0 ''';
  }

  String formattedWindspeed(WindspeedUnits speed) {
    return '''${windspeed.value.toStringAsPrecision(2)}${speed.isMs ? 'm/s' : 'mph'}''';
  }
}

extension Condition on WeatherCondition {
  Image get toImage {
    switch (this) {
      case WeatherCondition.clear:
        return Image.asset(
          'assets/icons/clear.png',
        );
      case WeatherCondition.rainy:
        return Image.asset(
          'assets/icons/rainy.png',
        );
      case WeatherCondition.cloudy:
        return Image.asset(
          'assets/icons/cloudy.png',
        );
      case WeatherCondition.snowy:
        return Image.asset(
          'assets/icons/snowy.png',
        );
      case WeatherCondition.heavyRain:
        return Image.asset(
          'assets/icons/heavy_rain.png',
        );
      case WeatherCondition.mostlyClear:
        return Image.asset(
          'assets/icons/mostly_clear.png',
        );
      case WeatherCondition.partlyCloudy:
        return Image.asset(
          'assets/icons/partly_cloudy.png',
        );
      case WeatherCondition.thunderstorm:
        return Image.asset(
          'assets/icons/thunderstorm.png',
        );
      case WeatherCondition.thunderstormWithHail:
        return Image.asset(
          'assets/icons/thunderstorm_with_hail.png',
        );
      case WeatherCondition.unknown:
        return Image.asset(
          'assets/icons/unknown.png',
        );
    }
  }

  String get toText {
    switch (this) {
      case WeatherCondition.clear:
        return 'Clear';
      case WeatherCondition.rainy:
        return 'Rainy';
      case WeatherCondition.cloudy:
        return 'Cloudy';
      case WeatherCondition.snowy:
        return 'Snowy';
      case WeatherCondition.heavyRain:
        return 'Heavy Rain';
      case WeatherCondition.mostlyClear:
        return 'Mostly Clear';
      case WeatherCondition.partlyCloudy:
        return 'Partly Cloudy';
      case WeatherCondition.thunderstorm:
        return 'Thunderstorm';
      case WeatherCondition.thunderstormWithHail:
        return 'Thunderstorm';
      case WeatherCondition.unknown:
        return 'Unknown';
    }
  }
}
