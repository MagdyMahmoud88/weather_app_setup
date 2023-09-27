import 'package:weather_app/model/weather_model.dart';

abstract class WeatherState {}

class InitialState extends WeatherState {}

class WeatherStateSucess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherStateSucess({required this.weatherModel});
}

class NoWeatherFailure extends WeatherState {
  final String errormessage;

  NoWeatherFailure(this.errormessage);
}
