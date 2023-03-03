import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../search/view/search_page.dart';
import '../../cubit/weather_cubit.dart';

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(50.0),
          child: Text('Please Select a City!',
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
        FilledButton(
            onPressed: () async {
              final city = await Navigator.of(context).push(SearchPage.route());
              // ignore: use_build_context_synchronously
              await context.read<WeatherCubit>().fetchWeather(city);
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0x1DFFFFFF)),
            ),
            child: const Icon(
              Icons.search,
              size: 40,
            ))
      ],
    );
  }
}
