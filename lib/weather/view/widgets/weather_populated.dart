import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/weather.dart';
import 'package:weather_app/search/search.dart';
import 'package:weather_app/settings/view/settings.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    super.key,
    required this.weather,
    required this.units,
    required this.speed,
    required this.onRefresh,
  });

  final Weather weather;
  final TemperatureUnits units;
  final WindspeedUnits speed;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _WeatherBackground(),
        RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
              child: Column(
                children: [
                  _AppBar(weather: weather),
                  _WeatherIcon(condition: weather.condition),
                  _Temperarature(
                    units: units,
                    weather: weather,
                  ),
                  _Windspped(
                    weather: weather,
                    speed: speed,
                  ),
                  _LastUpdate(weather: weather)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({required this.condition});

  static const double _iconSize = 230;

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _iconSize,
      width: _iconSize,
      child: condition.toImage,
    );
  }
}

extension on WeatherCondition {
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
}

class _WeatherBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color,
              color.brighten(),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Color {
  Color brighten() {
    return Color.fromARGB(alpha, red, green - 20.round(), blue);
  }
}

extension on Weather {
  String formattedTemperature(TemperatureUnits units) {
    return '''${temperature.value.toStringAsPrecision(2)}\u00B0''';
  }

  String formattedWindspeed(WindspeedUnits speed) {
    return windspeed.value.toStringAsPrecision(2);
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 10),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          TextButton.icon(
              onPressed: () async {
                final city =
                    await Navigator.of(context).push(SearchPage.route());

                // ignore: use_build_context_synchronously
                await context.read<WeatherCubit>().fetchWeather(city);
              },
              icon: Text(
                weather.location,
                style: const TextStyle(
                    color: Color(0xFF2f2e61),
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
              label: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: Color(0xFF2f2e61),
              )),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF2f2e61)),
            onPressed: () {
              Navigator.of(context).push<void>(
                SettingsPage.route(
                  context.read<WeatherCubit>(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Temperarature extends StatelessWidget {
  const _Temperarature({
    required this.weather,
    required this.units,
  });

  final Weather weather;
  final TemperatureUnits units;

  @override
  Widget build(BuildContext context) {
    return Text(
      ' ${weather.formattedTemperature(units)}',
      style: const TextStyle(
        color: Color(0xFF2f2e61),
        fontSize: 85,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _Windspped extends StatelessWidget {
  const _Windspped({required this.weather, required this.speed});

  final Weather weather;
  final WindspeedUnits speed;

  @override
  Widget build(BuildContext context) {
    return Text(
      ' ${weather.formattedWindspeed(speed)}',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}

class _LastUpdate extends StatelessWidget {
  const _LastUpdate({
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      '''Last Updated at ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}''',
      style: const TextStyle(
        color: Color(0xFF2f2e61),
      ),
    );
  }
}
