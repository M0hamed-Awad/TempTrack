import 'package:temp_track_app/helper/utils.dart';
import 'package:temp_track_app/models/weather_info_model.dart';
import 'package:temp_track_app/models/wind_model.dart';

class WeatherModel {
  final num maxTemp, avgTemp, minTemp, humidity, clouds;
  final String weatherConditionImage, cityName;
  final DateTime sunrise, sunset, lastUpdated;
  final WeatherInfoModel weather;
  final WindModel wind;

  WeatherModel({
    required this.cityName,
    required this.lastUpdated,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.weatherConditionImage,
    required this.weather,
    required this.sunrise,
    required this.sunset,
    required this.humidity,
    required this.wind,
    required this.clouds,
  });

  factory WeatherModel.fromJson(json) {
    var temp = json["main"];
    var weather = json["weather"][0];
    var wind = json["wind"];

    return WeatherModel(
      cityName: json["name"],
      lastUpdated: getDateFromUnixInSeconds(unixTimestamp: json["dt"]),
      maxTemp: temp["temp_max"],
      minTemp: temp["temp_min"],
      avgTemp: temp["temp"],
      weatherConditionImage: "assets/images/Clear.png",
      weather: WeatherInfoModel(
        main: weather["main"],
        description: weather["description"],
      ),
      sunrise: getDateFromUnixInSeconds(unixTimestamp: json["sys"]["sunrise"]),
      sunset: getDateFromUnixInSeconds(unixTimestamp: json["sys"]["sunset"]),
      humidity: temp["humidity"],
      wind: WindModel(
        speed: wind["speed"],
        degree: wind["deg"],
      ),
      clouds: json["clouds"]["all"],
    );
  }
}
