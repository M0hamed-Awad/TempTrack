import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:temp_track_app/helper/utils.dart';
import 'package:temp_track_app/widgets/colored_background.dart';
import 'package:temp_track_app/widgets/custom_loading_indicator.dart';
import 'package:temp_track_app/widgets/custom_text_form_field.dart';
import 'package:temp_track_app/widgets/initial_body.dart';
import 'package:temp_track_app/widgets/main_weather_card.dart';
import 'package:temp_track_app/widgets/no_weather_card.dart';
import 'package:temp_track_app/widgets/sub_weather_card.dart';
import 'package:temp_track_app/widgets/wind_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBackground(
      childWidget: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ),
                const CustomTextFormField(
                  hintText: "Enter City Name",
                  labelText: "Search",
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildWeatherBody(),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<GetCurrentWeatherCubit, GetWeatherState> _buildWeatherBody() {
    return BlocBuilder<GetCurrentWeatherCubit, GetWeatherState>(
      builder: (context, state) {
        // Initial Page
        if (state is GetWeatherInitial) {
          return const Center(
            child: InitialBody(),
          );
        } else if (state is GetWeatherSuccess || state is GetWeatherLoading) {
          return const Column(
            children: [
              MainWeatherCard(),
              SizedBox(
                height: 10,
              ),
              SubWeatherCard(),
              SizedBox(
                height: 10,
              ),
              WindCard(),
            ],
          );

          // Getting Weather Failure
        } else if (state is GetWeatherFailure) {
          return Center(
            child: NoWeatherCard(
              errMessage: state.errMessage,
            ),
          );
          // Loading
        } else {
          return buildMainCard(
            height: 180,
            context: context,
            child: const Center(
              child: CustomLoadingIndicator(),
            ),
          );
        }
      },
    );
  }
}
