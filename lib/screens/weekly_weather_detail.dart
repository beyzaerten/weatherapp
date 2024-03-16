import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/bloc/weather_event.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeeklyWeatherDetail extends StatelessWidget {
  const WeeklyWeatherDetail({Key? key, required this.weather})
      : super(key: key);
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    bool isDay = DateTime.now().hour >= 5 && DateTime.now().hour < 17;
    String bgImage = isDay ? "lib/assets/1.png" : "lib/assets/2.png";

    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, // Geri butonunun rengi beyaz olarak ayarlandı
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: phoneHeight / 7,
              ),
              Text(
                weather.day,
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              SizedBox(
                height: phoneHeight / 45,
              ),
              Image.network(
                weather.icon,
                scale: 3,
              ),
              SizedBox(
                height: phoneHeight / 45,
              ),
              Text(
                "${double.parse(weather.degree).toInt()}°",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                weather.description.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: phoneHeight / 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/assets/humidity.png",
                            width: phoneWidth / 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                'Nem',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${weather.humidity}%',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "lib/assets/night.png",
                            width: phoneWidth / 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                'Gece',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${double.parse(weather.night).toInt()}°",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: phoneHeight / 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: phoneWidth / 1.1,
                      child: Divider(),
                    ),
                  ),
                  SizedBox(
                    height: phoneHeight / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/assets/max_temp.png",
                            width: phoneWidth / 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                'E.Y',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${double.parse(weather.max).toInt()}°",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "lib/assets/min_temp.png",
                            width: phoneWidth / 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                'E.D',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${double.parse(weather.min).toInt()}°",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
