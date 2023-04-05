import 'package:flutter/material.dart';

import '../../../../models/weather.dart';

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
