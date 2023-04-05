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
          condition: $checkedConvert(
              'condition', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          lastUpdated: $checkedConvert(
              'last_updated', (v) => DateTime.parse(v as String)),
          location: $checkedConvert('location', (v) => v as String),
          timeZoneOffSet: $checkedConvert('time_zone_off_set', (v) => v as int),
          temperature: $checkedConvert('temperature',
              (v) => Temperature.fromJson(v as Map<String, dynamic>)),
          windspeed: $checkedConvert('windspeed',
              (v) => Windspeed.fromJson(v as Map<String, dynamic>)),
          humidity: $checkedConvert('humidity', (v) => v as int),
          pop: $checkedConvert(
              'pop',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
          hourlyTime: $checkedConvert('hourly_time',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          hourlyTemp: $checkedConvert(
              'hourly_temp',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
          hourlyWeatherCode: $checkedConvert('hourly_weather_code',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          dailyTime: $checkedConvert('daily_time',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          dailyWeatherCode: $checkedConvert('daily_weather_code',
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
        'lastUpdated': 'last_updated',
        'timeZoneOffSet': 'time_zone_off_set',
        'hourlyTime': 'hourly_time',
        'hourlyTemp': 'hourly_temp',
        'hourlyWeatherCode': 'hourly_weather_code',
        'dailyTime': 'daily_time',
        'dailyWeatherCode': 'daily_weather_code',
        'dailyTempMax': 'daily_temp_max',
        'dailyTempMin': 'daily_temp_min'
      },
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'condition': _$WeatherConditionEnumMap[instance.condition]!,
      'last_updated': instance.lastUpdated.toIso8601String(),
      'location': instance.location,
      'time_zone_off_set': instance.timeZoneOffSet,
      'temperature': instance.temperature.toJson(),
      'windspeed': instance.windspeed.toJson(),
      'humidity': instance.humidity,
      'hourly_time': instance.hourlyTime,
      'hourly_temp': instance.hourlyTemp,
      'pop': instance.pop,
      'hourly_weather_code': instance.hourlyWeatherCode,
      'daily_time': instance.dailyTime,
      'daily_weather_code': instance.dailyWeatherCode,
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

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Temperature',
      json,
      ($checkedConvert) {
        final val = Temperature(
          value: $checkedConvert('value', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

Windspeed _$WindspeedFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Windspeed',
      json,
      ($checkedConvert) {
        final val = Windspeed(
          value: $checkedConvert('value', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$WindspeedToJson(Windspeed instance) => <String, dynamic>{
      'value': instance.value,
    };
