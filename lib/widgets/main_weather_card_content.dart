import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_track_app/constants.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/helper/utils.dart';
import 'package:temp_track_app/models/weather_model.dart';

class MainWeatherCardContent extends StatelessWidget {
  const MainWeatherCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetCurrentWeatherCubit>(context).weatherModel;
    return SizedBox(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: _buildFirstColumnOfWeatherCard(weatherModel),
          ),
          VerticalDivider(
            thickness: 5,
            color: Colors.black.withOpacity(0.05),
            indent: 30,
            endIndent: 30,
          ),
          SizedBox(
            width: 150,
            child: _buildSecondColumnOfWeatherCard(weatherModel),
          )
        ],
      ),
    );
  }

  Column _buildFirstColumnOfWeatherCard(WeatherModel? weatherModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            weatherModel!.weather.main,
            style: const TextStyle(
              fontSize: 18,
              color: kMainTextColor,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Image.asset(
          getWeatherImage(weatherModel.weather.main),
          width: 100,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          weatherModel.weather.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: kMainTextColor,
          ),
        ),
      ],
    );
  }

  Column _buildSecondColumnOfWeatherCard(WeatherModel? weatherModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTemperatureSection(weatherModel!.avgTemp),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Humidity: ",
            style: const TextStyle(
              fontFamily: "ShareTechMono",
              fontSize: 18,
              color: kSubTextColor,
            ),
            children: [
              TextSpan(
                text: weatherModel.humidity.toString(),
                style: const TextStyle(
                  color: kMainTextColor,
                ),
              )
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Cloudiness: ",
            style: const TextStyle(
              fontFamily: "ShareTechMono",
              fontSize: 16,
              color: kSubTextColor,
            ),
            children: [
              TextSpan(
                text: "${weatherModel.clouds}%",
                style: const TextStyle(
                  color: kMainTextColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Row _buildTemperatureSection(num avgTemp) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (avgTemp.round()).toString(),
            style: const TextStyle(
              fontSize: 60,
              color: Color(0xff27B1FE),
            ),
          ),
          Image.asset(
            "assets/images/Celsius.png",
            width: 70,
          ),
        ],
      );
  }
}
