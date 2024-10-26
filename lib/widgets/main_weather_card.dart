import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:temp_track_app/helper/utils.dart';
import 'package:temp_track_app/widgets/custom_loading_indicator.dart';
import 'package:temp_track_app/widgets/main_weather_card_city_and_date.dart';
import 'package:temp_track_app/widgets/main_weather_card_content.dart';

class MainWeatherCard extends StatefulWidget {
  const MainWeatherCard({super.key});

  @override
  State<MainWeatherCard> createState() => _MainWeatherCardState();
}

class _MainWeatherCardState extends State<MainWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentWeatherCubit, GetWeatherState>(
      builder: (context, state) {
        if (state is GetWeatherLoading) {
          return _buildLoadingBody(context);
        } else {
          return _buildWeatherInfoBody(context);
        }
      },
    );
  }

  Widget _buildWeatherInfoBody(context) {
    return buildMainCard(
      height: 290,
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const MainWeatherCardCityAndDate(),
          Divider(
            thickness: 5,
            color: Colors.black.withOpacity(0.05),
            indent: 20,
            endIndent: 20,
          ),
          const MainWeatherCardContent(),
        ],
      ),
    );
  }

  Widget _buildLoadingBody(context) {
    return buildMainCard(
      height: 180,
      context: context,
      child: const Center(
        child: CustomLoadingIndicator(),
      ),
    );
  }
}
