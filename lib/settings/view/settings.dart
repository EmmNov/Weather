import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/cubit/weather_cubit.dart';
import 'package:weather_app/weather/models/models.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage._();

  static Route<void> route(WeatherCubit weatherCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: const SettingsPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF232535),
          title: const Text('Settings')),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        // buildWhen: ,
        builder: (context, state) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0x1DFFFFFF),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Temperature Units',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      isThreeLine: true,
                      subtitle: const Text(
                        'Use metric measurements for temperature units.',
                        style: TextStyle(
                            color: Color.fromARGB(181, 255, 255, 255)),
                      ),
                      trailing: Switch(
                        value: state.temperatureUnits.isCelsius,
                        onChanged: (_) =>
                            context.read<WeatherCubit>().toggleUnits(),
                      ),
                    ),
                    const Divider(
                      color: Color(0x4AFFFFFF),
                      endIndent: 15,
                      indent: 15,
                    ),
                    ListTile(
                      title: const Text(
                        'Speed Units',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      isThreeLine: true,
                      subtitle: const Text(
                        'Use metric measurements for speed units.',
                        style: TextStyle(
                            color: Color.fromARGB(181, 255, 255, 255)),
                      ),
                      trailing: Switch(
                        value: state.windspeedUnits.isKmh,
                        onChanged: (_) =>
                            context.read<WeatherCubit>().toggleSpeed(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
