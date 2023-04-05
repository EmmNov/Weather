// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Weather',
      json,
      ($checkedConvert) {
        final val = Weather(
          location: $checkedConvert('location', (v) => v as String),
          timeOffSet: $checkedConvert('time_off_set', (v) => v as int),
          temperature:
              $checkedConvert('temperature', (v) => (v as num).toDouble()),
          windspeed: $checkedConvert('windspeed', (v) => (v as num).toDouble()),
          condition: $checkedConvert(
              'condition', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          humidity: $checkedConvert('humidity', (v) => v as int),
          hourlyTime: $checkedConvert('hourly_time',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          hourlyTemp: $checkedConvert(
              'hourly_temp',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
          pop: $checkedConvert(
              'pop',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
          hourlyWeatherCode: $checkedConvert('hourly_weather_code',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          dailyTime: $checkedConvert('daily_time',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          dailyWeathercode: $checkedConvert('daily_weathercode',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          dailyTempMax: $checkedConvert(
              'daily_temp_max',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
          dailyTempMin: $checkedConvert(
              'daily_temp_min',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'timeOffSet': 'time_off_set',
        'hourlyTime': 'hourly_time',
        'hourlyTemp': 'hourly_temp',
        'hourlyWeatherCode': 'hourly_weather_code',
        'dailyTime': 'daily_time',
        'dailyWeathercode': 'daily_weathercode',
        'dailyTempMax': 'daily_temp_max',
        'dailyTempMin': 'daily_temp_min'
      },
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'time_off_set': instance.timeOffSet,
      'temperature': instance.temperature,
      'windspeed': instance.windspeed,
      'condition': _$WeatherConditionEnumMap[instance.condition]!,
      'humidity': instance.humidity,
      'hourly_time': instance.hourlyTime,
      'hourly_temp': instance.hourlyTemp,
      'pop': instance.pop,
      'hourly_weather_code': instance.hourlyWeatherCode,
      'daily_time': instance.dailyTime,
      'daily_weathercode': instance.dailyWeathercode,
      'daily_temp_max': instance.dailyTempMax,
      'daily_temp_min': instance.dailyTempMin,
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.clear: 'clear',
  WeatherCondition.mostlyClear: 'mostlyClear',
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.heavyRain: 'heavyRain',
  WeatherCondition.thunderstorm: 'thunderstorm',
  WeatherCondition.thunderstormWithHail: 'thunderstormWithHail',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.partlyCloudy: 'partlyCloudy',
  WeatherCondition.snowy: 'snowy',
  WeatherCondition.unknown: 'unknown',
};
