import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/screens/weather_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(),
      ),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    ),
  ));
}
