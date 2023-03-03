// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'hourly_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hourly _$HourlyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Hourly',
      json,
      ($checkedConvert) {
        final val = Hourly(
          time: $checkedConvert('time',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          temperature: $checkedConvert('temperature_2m',
              (v) => (v as List<dynamic>).map((e) => e as double).toList()),
          humidity: $checkedConvert('relativehumidity_2m',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          precipitation: $checkedConvert('precipitation_probability',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          weatherCode: $checkedConvert('weathercode',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperature': 'temperature_2m',
        'humidity': 'relativehumidity_2m',
        'precipitation': 'precipitation_probability',
        'weatherCode': 'weathercode'
      },
    );
