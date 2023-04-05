import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import '../../../theme/cubit/theme_cubit.dart';
import 'package:weather_app/theme/theme.dart';
import 'package:weather_app/weather/weather.dart';
import 'package:weather_app/weather/extention.dart';
import 'package:intl/intl.dart';

class DailyPage extends StatelessWidget {
  const DailyPage._();

  static Route<void> route(WeatherCubit weatherCubit) {
    return MaterialPageRoute<void>(
      maintainState: false,
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: const DailyPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit(context.read<WeatherRepository>()),
        child: const DailyView());
  }
}

class DailyView extends StatelessWidget {
  const DailyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<ThemeCubit>().updateTheme(state.weather);
            }
          },
          builder: (context, state) {
            if (state.status == WeatherStatus.success) {
              return DailyInfo(
                weather: state.weather,
                units: state.temperatureUnits,
                speed: state.windspeedUnits,
                onRefresh: () {
                  return context.read<WeatherCubit>().refreshWeather();
                },
              );
            } else {
              return const WeatherError();
            }
          },
        ),
      ),
    );
  }
}

class DailyInfo extends StatelessWidget {
  const DailyInfo({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CurrentWeather(weather: weather, units: units, speed: speed),
        const Padding(
          padding: EdgeInsets.only(
            top: 25,
            left: 25,
          ),
          child: Text(
            'Next week',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        DailyWeather(weather: weather),
      ],
    );
  }
}

class _CurrentWeather extends StatelessWidget {
  const _CurrentWeather(
      {required this.weather, required this.units, required this.speed});

  final Weather weather;
  final TemperatureUnits units;
  final WindspeedUnits speed;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    const double iconSize = 120;

    return Container(
      alignment: Alignment.topCenter,
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color,
            color.brighten(),
          ],
        ),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 12, 24, 29),
              offset: Offset(0, 7),
              blurRadius: 10)
        ],
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(60)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 35, 10, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      color: Color(0xFF2f2e61),
                      size: 30,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(weather.location,
                        style: const TextStyle(
                            color: Color(0xFF2f2e61),
                            fontSize: 23,
                            fontWeight: FontWeight.w600))),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: iconSize,
                    width: iconSize,
                    child: weather.condition.toImage,
                  ),
                  Column(
                    children: [
                      Text(
                        weather.condition.toText,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2f2e61),
                        ),
                      ),
                      Text(
                        '  ${weather.formattedTemperature(units)}',
                        style: const TextStyle(
                            color: Color(0xFF2f2e61),
                            fontSize: 75,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DailyWeather extends StatelessWidget {
  const DailyWeather({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    double iconsize = 25;
    return Expanded(
      child: ListView.builder(
        primary: false,
        itemCount: weather.dailyTempMax.length,
        itemBuilder: (context, index) {
          var weekday = DateFormat('EEE').format(
              DateTime.fromMillisecondsSinceEpoch(
                  weather.dailyTime[index] * 1000));

          return Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, bottom: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weekday,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 209, 209, 209),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '${weather.dailyTempMax[index].toInt()}\u00B0 ',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: ' ${weather.dailyTempMin[index].toInt()}\u00B0',
                      style: const TextStyle(
                          color: Color.fromARGB(108, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                ])),
                SizedBox(
                  height: iconsize,
                  width: iconsize,
                  child: weather.dailyWeatherCode[index].toIcon,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
