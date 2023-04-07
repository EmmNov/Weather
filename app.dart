import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/theme/theme.dart';
import 'package:weather_app/weather/view/current_weather/weather_page.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: const WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, color) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: const TextTheme(
                bodyMedium: TextStyle(
              color: AppColor.purpul,
            )),
            iconTheme: const IconThemeData(
              color: AppColor.purpul,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColor.purpul,
              ),
            ),
            scaffoldBackgroundColor: AppColor.backgroundPurpul,
            primaryColor: color,
            // textTheme: GoogleFonts.baloo2TextTheme(),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: AppColor.backgroundPurpul,
            ),
          ),
          home: const WeatherPage(),
        );
      },
    );
  }
}
