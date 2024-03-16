import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/screens/weather_screen.dart';
import 'package:weatherapp/screens/weekly_weather_detail.dart';

class WeeklyWeather extends StatelessWidget {
  const WeeklyWeather({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: phoneHeight / 15,
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        WeeklyWeatherDetail(weather: weather)));
              },
              child: Row(
                children: [
                  Text(
                    "${weather.day}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Spacer(),
                  Image.asset(
                    "lib/assets/humidity.png",
                    width: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    '${weather.humidity}%',
                  ),
                  SizedBox(
                    width: phoneWidth / 10,
                  ),
                  Image.network(
                    weather.icon,
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "${double.parse(weather.degree).toInt()}°",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: phoneHeight / 55,
        )
      ],
    );
  }
}
