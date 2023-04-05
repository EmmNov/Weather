import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../search/view/search_page.dart';
import '../../../cubit/weather_cubit.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/icons/error.png',
            height: 100,
            width: 100,
          ),
        ),
        const Text('Something went wrong!',
            style: TextStyle(color: Colors.white, fontSize: 25)),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: FilledButton(
            onPressed: () async {
              final city = await Navigator.of(context).push(SearchPage.route());
              // ignore: use_build_context_synchronously
              await context.read<WeatherCubit>().fetchWeather(city);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0x1DFFFFFF)),
            ),
            child: const Text(
              'Try Again',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
