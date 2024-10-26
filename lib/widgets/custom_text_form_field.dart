import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_weather_states.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
  });

  final String hintText, labelText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentWeatherCubit, GetWeatherState>(
      builder: (context, state) {
        String cityName = "";
        return TextField(
          onSubmitted: (cityName) async {
            cityName = cityName;

            BlocProvider.of<GetCurrentWeatherCubit>(context)
                .getCurrentWeather(cityName: cityName);
          },
          cursorColor: Colors.white,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                BlocProvider.of<GetCurrentWeatherCubit>(context)
                    .getCurrentWeather(cityName: cityName);
              },
              icon: const Icon(Icons.search),
              iconSize: 32,
              color: Colors.white,
            ),
            suffixIconColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            enabledBorder: buildBorder(Colors.white),
            focusedBorder: buildBorder(Colors.white),
            errorBorder: buildBorder(const Color(0xFFE93121)),
            focusedErrorBorder: buildBorder(const Color(0xFFE93121)),
            errorStyle: const TextStyle(color: Color(0xFFE93121)),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildBorder(borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
