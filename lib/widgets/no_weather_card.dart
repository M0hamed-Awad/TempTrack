import 'package:flutter/material.dart';
import 'package:temp_track_app/constants.dart';
import 'package:temp_track_app/helper/utils.dart';

class NoWeatherCard extends StatelessWidget {
  const NoWeatherCard({
    super.key,
    required this.errMessage,
  });

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return buildMainCard(
      height: 240,
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.error,
            color: kErrorColor,
            size: 54,
          ),
          Text(
            errMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
            ),
          )
        ],
      ),
    );
  }
}
