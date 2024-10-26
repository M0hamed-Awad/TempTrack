import 'package:dio/dio.dart';
import 'package:temp_track_app/helper/api.dart';
import 'package:temp_track_app/models/weather_model.dart';

class WeatherService {
  WeatherService();

  final Dio dio = Dio();
  final String baseURL = "https://api.openweathermap.org/data/2.5";
  final String apiKey = "555efc723e96134c542e8fec5cbb5e66";

  Future<WeatherModel> getCurrentWeather({
    required String cityName,
  }) async {
    Map<String, dynamic> json = await Api()
        .get(url: "$baseURL/weather?q=$cityName&units=metric&appid=$apiKey");

    WeatherModel weatherModel = WeatherModel.fromJson(json);

    return weatherModel;
  }
}
