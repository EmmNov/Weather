import 'package:flutter/material.dart';

extension A on int {
  Image get toIcon {
    switch (this) {
      case 800:
        return Image.asset(
          'assets/icons/sun.png',
        );
      case 801:
      case 802:
        return Image.asset(
          'assets/icons/partly_cloudy_day.png',
        );
      case 803:
        return Image.asset(
          'assets/icons/partly_cloudy_day.png',
        );
      case 804:
        return Image.asset(
          'assets/icons/clouds.png',
        );
      case 504:
      case 511:
      case 520:
      case 521:
      case 522:
      case 531:
        return Image.asset(
          'assets/icons/rain.png',
        );
      case 200:
      case 201:
      case 202:
      case 210:
      case 211:
      case 212:
      case 221:
      case 230:
      case 231:
      case 323:
        return Image.asset(
          'assets/icons/storm.png',
        );
      case 96:
      case 99:
        return Image.asset(
          'assets/icons/cloud_lighting.png',
        );
      case 300:
      case 301:
      case 302:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 321:
      case 500:
      case 501:
      case 502:
      case 503:
        return Image.asset(
          'assets/icons/little_rain.png',
        );
      case 600:
      case 601:
      case 602:
      case 611:
      case 612:
      case 613:
      case 615:
      case 616:
      case 620:
      case 621:
      case 622:
        return Image.asset(
          'assets/icons/snow.png',
        );
      default:
        return Image.asset(
          'assets/icons/unknown.png',
        );
    }
  }

  DateTime toTime() =>
      (DateTime.fromMillisecondsSinceEpoch(this * 1000, isUtc: true));
}

extension B on Color {
  Color brighten() {
    return Color.fromARGB(alpha, red, green - 35.round(), blue);
  }
}

extension C on double {
  double toFahrenheit() => (this * 9 / 5) + 32;
  double toCelsius() => (this - 32) * 5 / 9;
  double toMph() => this * 2.237;
  double toMs() => this / 2.237;
}
