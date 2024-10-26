import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_track_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:temp_track_app/models/weather_model.dart';
import 'package:temp_track_app/services/weather_service.dart';

class GetCurrentWeatherCubit extends Cubit<GetWeatherState> {
  GetCurrentWeatherCubit()
      : super(
          GetWeatherInitial(),
        );

  WeatherModel? weatherModel;

  getCurrentWeather({required String cityName}) async {
    try {
      emit(
        GetWeatherLoading(),
      );

      weatherModel =
          await WeatherService().getCurrentWeather(cityName: cityName);

      emit(
        GetWeatherSuccess(),
      );
    } catch (e) {
      emit(
        GetWeatherFailure(errMessage: e.toString()),
      );
    }
  }
}
