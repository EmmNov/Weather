import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final double lat;
  final double lon;
  final int timezoneOffset;
  final Current current;
  final List<Hourly> hourly;
  final List<Daily> daily;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Weather(
      {required this.lat,
      required this.lon,
      required this.timezoneOffset,
      required this.current,
      required this.hourly,
      required this.daily});
}

@JsonSerializable()
class Current {
  final int dt;
  final double temp;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final List<Condition> condition;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Current(
      {required this.dt,
      required this.temp,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.condition});
}

@JsonSerializable()
class Condition {
  final int id;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Condition({
    required this.id,
  });
}

@JsonSerializable()
class Hourly {
  final int dt;
  final double temp;
  final List<Condition> condition;
  final double pop;

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Hourly({
    required this.dt,
    required this.temp,
    required this.condition,
    required this.pop,
  });
}

@JsonSerializable()
class Daily {
  final int dt;
  final Temp temp;
  final List<Condition> condition;

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Daily({
    required this.dt,
    required this.temp,
    required this.condition,
  });
}

@JsonSerializable()
class Temp {
  final double day;
  final double min;
  final double max;

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Temp({
    required this.day,
    required this.min,
    required this.max,
  });
}
