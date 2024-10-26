import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/models/weather_model.dart';
import 'package:temp_track_app/widgets/weather_details.dart';

class SubWeatherCardContent extends StatelessWidget {
  const SubWeatherCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetCurrentWeatherCubit>(context).weatherModel;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 140,
          child: Row(
            children: [
              _buildSunriseSunsetCol(weatherModel),
              const Spacer(),
              VerticalDivider(
                thickness: 5,
                color: Colors.black.withOpacity(0.05),
                endIndent: 20,
              ),
              const Spacer(),
              _buildMinMaxTempCol(weatherModel),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMinMaxTempCol(WeatherModel? weatherModel) {
    return SizedBox(
      width: 165,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WeatherDetails(
            image: "assets/images/Max_Temp.png",
            firstRowText: "Max Temp",
            secondRowText: "${weatherModel!.maxTemp.round()}°",
          ),
          const SizedBox(
            height: 16,
          ),
          WeatherDetails(
            image: "assets/images/Min_Temp.png",
            firstRowText: "Min Temp",
            secondRowText: "${weatherModel.minTemp.round()}°",
          ),
        ],
      ),
    );
  }

  Widget _buildSunriseSunsetCol(WeatherModel? weatherModel) {
    return SizedBox(
      width: 165,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WeatherDetails(
            image: "assets/images/Sunrise.png",
            firstRowText: "Sunrise",
            secondRowText: DateFormat().add_jm().format(weatherModel!.sunrise),
          ),
          const SizedBox(
            height: 16,
          ),
          WeatherDetails(
            image: "assets/images/Sunset_V2.png",
            firstRowText: "Sunset",
            secondRowText: DateFormat().add_jm().format(weatherModel.sunset),
          ),
        ],
      ),
    );
  }
}
