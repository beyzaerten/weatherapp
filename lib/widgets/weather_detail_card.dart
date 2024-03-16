import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherDetailCard extends StatefulWidget {
  const WeatherDetailCard({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;

  @override
  _WeatherDetailCardState createState() => _WeatherDetailCardState();
}

class _WeatherDetailCardState extends State<WeatherDetailCard> {
  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Image.asset(
                "lib/assets/humidity.png",
                scale: 11,
              ),
              Column(
                children: [
                  const Text(
                    'Nem',
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 232, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.weather.humidity}%',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 240, 232, 255),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                "lib/assets/night.png",
                scale: 11,
              ),
              Column(
                children: [
                  const Text(
                    'Gece',
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 232, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${double.parse(widget.weather.night).round()}°C',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 240, 232, 255),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                "lib/assets/max_temp.png",
                scale: 11,
              ),
              Column(
                children: [
                  const Text(
                    'E.Y',
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 232, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${double.parse(widget.weather.max).round()}°C',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 240, 232, 255),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                "lib/assets/min_temp.png",
                scale: 11,
              ),
              Column(
                children: [
                  const Text(
                    'E.D',
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 232, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${double.parse(widget.weather.min).round()}°C',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 240, 232, 255),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
