import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:temp_track_app/constants.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:temp_track_app/helper/utils.dart';
import 'package:temp_track_app/models/weather_model.dart';
import 'package:temp_track_app/widgets/custom_loading_indicator.dart';

class WindCard extends StatelessWidget {
  const WindCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentWeatherCubit, GetWeatherState>(
      builder: (context, state) {
        WeatherModel? weatherModel =
            BlocProvider.of<GetCurrentWeatherCubit>(context).weatherModel;
        if (state is GetWeatherLoading) {
          return _buildLoadingBody(context);
        } else {
          return _buildWindInfoBody(weatherModel, context);
        }
      },
    );
  }

  Widget _buildLoadingBody(context) {
    return buildMainCard(
      height: 150,
      child: const Center(
        child: CustomLoadingIndicator(),
      ),
      context: context,
    );
  }

  Widget _buildWindInfoBody(WeatherModel? weatherModel, context) {
    return buildMainCard(
      height: 140,
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildWindTextInfo(
            title: "Wind Degree: ",
            info: "${weatherModel!.wind.speed} °",
          ),
          _buildWindTextInfo(
            title: "Wind Speed: ",
            info: "${weatherModel.wind.degree} Meter/Sec",
          ),
          _buildWindAnimation(),
        ],
      ),
    );
  }

  Row _buildWindTextInfo({
    required String title,
    required String info,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: kSubTextColor,
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 18,
            color: kMainTextColor,
          ),
        ),
      ],
    );
  }

  SizedBox _buildWindAnimation() {
    return SizedBox(
      height: 50,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -70,
            right: 30,
            child: Lottie.asset(
              "assets/animations/wind_animation.json",
              width: 280,
            ),
          ),
        ],
      ),
    );
  }
}
