import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/weather/weather.dart';

class ThemeCubit extends HydratedCubit<Color> {
  ThemeCubit() : super(defaultColor);

  static const defaultColor = Color(0xFF70f5ea);

  void updateTheme(Weather? weather) {
    if (weather != null) emit(weather.toColor);
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    return Color(int.parse(json['color'] as String));
  }

  @override
  Map<String, dynamic> toJson(Color state) {
    return <String, String>{'color': '${state.value}'};
  }
}

extension on Weather {
  Color get toColor {
    switch (condition) {
      case WeatherCondition.clear:
        return const Color(0xFFfae177);
      case WeatherCondition.mostlyClear:
        return const Color(0xFFfae177);
      case WeatherCondition.snowy:
        return const Color(0xFFBEE1EC);
      case WeatherCondition.cloudy:
        return const Color(0xFF92E0DA);
      case WeatherCondition.partlyCloudy:
        return const Color(0xFF70F5EA);
      case WeatherCondition.rainy:
        return const Color(0xFF889DCA);
      case WeatherCondition.unknown:
        return ThemeCubit.defaultColor;
      case WeatherCondition.thunderstorm:
        return const Color(0xFF797E66);
      case WeatherCondition.thunderstormWithHail:
        return const Color(0xFF5780A7);
      case WeatherCondition.heavyRain:
        return const Color(0xFF66789E);
    }
  }
}
