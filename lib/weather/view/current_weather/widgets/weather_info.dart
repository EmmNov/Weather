import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/view/daily_weather/daily_page.dart';
import 'package:weather_app/weather/weather.dart';
import 'package:weather_app/search/search.dart';
import 'package:weather_app/settings/view/settings.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather/extention.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
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
                  _Condition(weather: weather),
                  _Temperarature(
                    units: units,
                    weather: weather,
                  ),
                  _WeatherParameters(weather: weather, speed: speed),
                  const _HourlyParameters(),
                  _HourlyWeather(
                    weather: weather,
                  ),
                  _LastUpdate(weather: weather),
                ],
              ),
            ),
          ),
        ),
      ],
    );
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

class _Condition extends StatelessWidget {
  const _Condition({required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      weather.condition.toText,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF2f2e61),
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        '  ${weather.formattedTemperature(units)}',
        style: const TextStyle(
          color: Color(0xFF2f2e61),
          fontSize: 100,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _WeatherParameters extends StatelessWidget {
  const _WeatherParameters({required this.weather, required this.speed});

  final Weather weather;
  final WindspeedUnits speed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.air,
                color: Color(0xFF2f2e61),
                size: 15,
              ),
              Text(
                weather.formattedWindspeed(speed),
                style: const TextStyle(
                    color: Color(0xFF2f2e61),
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.water_drop_outlined,
                size: 15,
                color: Color(0xFF2f2e61),
              ),
              Text(
                '${weather.humidity}%',
                style: const TextStyle(
                    color: Color(0xFF2f2e61),
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.snowing,
                color: Color(0xFF2f2e61),
                size: 15,
              ),
              Text(
                '${(weather.pop.first * 100).toInt()}%',
                style: const TextStyle(
                    color: Color(0xFF2f2e61),
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _HourlyParameters extends StatelessWidget {
  const _HourlyParameters();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2f2e61),
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      DailyPage.route(
                        context.read<WeatherCubit>(),
                      ),
                    );
                  },
                  icon: const Text(
                    '7 days',
                    style: TextStyle(
                        color: Color.fromARGB(200, 47, 46, 97),
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  label: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromARGB(200, 47, 46, 97),
                    size: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HourlyWeather extends StatelessWidget {
  const _HourlyWeather({
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    double iconSize = 50;

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: 24,
        itemBuilder: (context, index) {
          var hourlyTime = DateFormat('kk:mm').format(
              (weather.hourlyTime[index] + weather.timeZoneOffSet).toTime());
          return Container(
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: const Color.fromARGB(62, 255, 255, 255),
                borderRadius: BorderRadius.circular(25)),
            width: 76,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    hourlyTime,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(102, 102, 128, 1),
                    ),
                  ),
                  SizedBox(
                    height: iconSize,
                    width: iconSize,
                    child: weather.hourlyWeatherCode[index].toIcon,
                  ),
                  Text(
                    '${weather.hourlyTemp[index].toInt()}\u00B0',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(67, 66, 116, 1),
                    ),
                  ),
                ]),
          );
        },
      ),
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
        fontSize: 10,
        color: Color(0xFF2f2e61),
      ),
    );
  }
}
