class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {}

class GetWeatherLoading extends GetWeatherState {}

class GetWeatherSuccess extends GetWeatherState {}

class GetWeatherFailure extends GetWeatherState {
  final String errMessage;

  GetWeatherFailure({required this.errMessage});
}
