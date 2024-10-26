import 'package:flutter/material.dart';
import 'package:temp_track_app/widgets/weather_details.dart';

class SubWeatherCardColumn extends StatelessWidget {
  const SubWeatherCardColumn({
    super.key,
    required this.firstRow,
    required this.secondRow,
  });

  final WeatherDetails firstRow, secondRow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          firstRow,
          const SizedBox(
            height: 16,
          ),
          secondRow,
        ],
      ),
    );
  }
}
