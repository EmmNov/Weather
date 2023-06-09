// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Weather',
      json,
      ($checkedConvert) {
        final val = Weather(
          lat: $checkedConvert('lat', (v) => (v as num).toDouble()),
          lon: $checkedConvert('lon', (v) => (v as num).toDouble()),
          timezoneOffset: $checkedConvert('timezone_offset', (v) => v as int),
          current: $checkedConvert(
              'current', (v) => Current.fromJson(v as Map<String, dynamic>)),
          hourly: $checkedConvert(
              'hourly',
              (v) => (v as List<dynamic>)
                  .map((e) => Hourly.fromJson(e as Map<String, dynamic>))
                  .toList()),
          daily: $checkedConvert(
              'daily',
              (v) => (v as List<dynamic>)
                  .map((e) => Daily.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'timezoneOffset': 'timezone_offset'},
    );

Current _$CurrentFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Current',
      json,
      ($checkedConvert) {
        final val = Current(
          dt: $checkedConvert('dt', (v) => v as int),
          temp: $checkedConvert('temp', (v) => (v as num).toDouble()),
          pressure: $checkedConvert('pressure', (v) => v as int),
          humidity: $checkedConvert('humidity', (v) => v as int),
          windSpeed:
              $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          condition: $checkedConvert(
              'weather',
              (v) => (v as List<dynamic>)
                  .map((e) => Condition.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'feelsLike': 'feels_like',
        'dewPoint': 'dew_point',
        'windSpeed': 'wind_speed',
        'windDeg': 'wind_deg'
      },
    );

Condition _$ConditionFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Condition',
      json,
      ($checkedConvert) {
        final val = Condition(
          id: $checkedConvert('id', (v) => v as int),
        );
        return val;
      },
    );

Hourly _$HourlyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Hourly',
      json,
      ($checkedConvert) {
        final val = Hourly(
            dt: $checkedConvert('dt', (v) => v as int),
            temp: $checkedConvert('temp', (v) => (v as num).toDouble()),
            condition: $checkedConvert(
                'weather',
                (v) => (v as List<dynamic>)
                    .map((e) => Condition.fromJson(e as Map<String, dynamic>))
                    .toList()),
            pop: $checkedConvert('pop', (v) => (v as num).toDouble()));

        return val;
      },
    );

Daily _$DailyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Daily',
      json,
      ($checkedConvert) {
        final val = Daily(
          dt: $checkedConvert('dt', (v) => v as int),
          temp: $checkedConvert(
              'temp', (v) => Temp.fromJson(v as Map<String, dynamic>)),
          condition: $checkedConvert(
              'weather',
              (v) => (v as List<dynamic>)
                  .map((e) => Condition.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'moonPhase': 'moon_phase',
        'feelsLike': 'feels_like',
        'dewPoint': 'dew_point',
        'windSpeed': 'wind_speed',
        'windDeg': 'wind_deg',
        'windGust': 'wind_gust'
      },
    );

Temp _$TempFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Temp',
      json,
      ($checkedConvert) {
        final val = Temp(
          day: $checkedConvert('day', (v) => (v as num).toDouble()),
          min: $checkedConvert('min', (v) => (v as num).toDouble()),
          max: $checkedConvert('max', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );
