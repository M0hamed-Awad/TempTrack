import 'package:flutter/material.dart';
import 'package:temp_track_app/helper/utils.dart';

class InitialBody extends StatelessWidget {
  const InitialBody({super.key});

  @override
  Widget build(BuildContext context) {
    return buildMainCard(
      height: 240,
      context:context,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome To TempTrack! 🤩',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Start searching now 🔍',
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}
