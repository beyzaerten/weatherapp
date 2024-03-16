import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherapp/bloc/weather_event.dart';
import 'package:weatherapp/bloc/weather_state.dart';
import 'package:weatherapp/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      try {
        final city = await WeatherRepository().getLocation();
        final weather = await WeatherRepository().getWeatherData();
        emit(WeatherLoaded(city: city, weathers: weather));
      } catch (e) {
        emit(WeatherError());
        print("hata $e");
      }
    });

    on<ResetFetchWeatherEvent>((event, emit) async {
      emit(WeatherInitial());
    });
  }
}
