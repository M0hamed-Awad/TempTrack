import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:temp_track_app/helper/utils.dart';
import 'package:temp_track_app/widgets/custom_loading_indicator.dart';
import 'package:temp_track_app/widgets/sub_weather_card_content.dart';

class SubWeatherCard extends StatelessWidget {
  const SubWeatherCard({super.key});

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
      height: 160,
      context: context,
      child: const SubWeatherCardContent(),
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
