import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:temp_track_app/helper/utils.dart';
import 'package:temp_track_app/views/home_view.dart';

void main() {
  runApp(const TempTrackApp());
}

class TempTrackApp extends StatelessWidget {
  const TempTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCurrentWeatherCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<GetCurrentWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "ShareTechMono",
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetCurrentWeatherCubit>(context)
                      .weatherModel
                      ?.weather
                      .main,
                ),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}
