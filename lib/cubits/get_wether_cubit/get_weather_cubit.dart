import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_wether_cubit/get_weather_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());

  WeatherModel? weatherModel;
  getCurrentWeather({required String val}) async {
    try {
      weatherModel =
          await WeatherService(dio: Dio()).getCurrentWeather(cityName: val);
      emit(
        WeatherStateSucess(weatherModel: weatherModel!),
      );
    } catch (e) {
      emit(
        NoWeatherFailure(
          e.toString(),
        ),
      );
    }
  }
}
