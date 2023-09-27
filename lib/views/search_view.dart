import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_wether_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: TextField(
          onSubmitted: ((value) async {
            var getWeather = BlocProvider.of<GetWeatherCubit>(context)
                .getCurrentWeather(val: value);
            Navigator.of(context).pop();
          }),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            labelText: 'Search',
            suffixIcon: Icon(Icons.search),
            hintText: 'Enter City name',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
