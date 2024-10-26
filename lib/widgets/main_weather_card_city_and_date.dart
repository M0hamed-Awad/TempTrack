import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:temp_track_app/constants.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/models/weather_model.dart';

class MainWeatherCardCityAndDate extends StatelessWidget {
  const MainWeatherCardCityAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetCurrentWeatherCubit>(context).weatherModel;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weatherModel!.cityName.toUpperCase(),
          style: const TextStyle(
            fontSize: 28,
            color: kMainTextColor,
          ),
        ),
        Text(
          DateFormat('EEEE d MMMM | ')
              .add_jm()
              .format(weatherModel.lastUpdated)
              .toString(),
          style: const TextStyle(
            fontSize: 18,
            color: kSubTextColor,
          ),
        ),
      ],
    );
  }
}
