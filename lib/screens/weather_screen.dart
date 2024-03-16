import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/bloc/weather_event.dart';
import 'package:weatherapp/bloc/weather_state.dart';
import 'package:weatherapp/widgets/weather_detail_card.dart';
import 'package:weatherapp/widgets/weekly_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String time = "";

  void setTime() {
    final hour = DateTime.now().hour;

    setState(() {
      if (hour >= 5 && hour < 11) {
        time = "Günaydın";
      } else if (hour >= 11 && hour < 17) {
        time = "İyi günler";
      } else if (hour >= 17 && hour < 23) {
        time = "İyi akşamlar";
      } else {
        time = "İyi geceler";
      }
    });
  }

  Future<void> _refresh() async {
    context.read<WeatherBloc>().add(FetchWeather());
  }

  @override
  void initState() {
    context.read<WeatherBloc>().add(FetchWeather());
    setTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    String getCurrentDate() {
      DateTime now = DateTime.now();
      String formattedDate = "${now.day}.${now.month}.${now.year}";
      return formattedDate;
    }

    String getCurrentTime() {
      DateTime now = DateTime.now();
      String hour = now.hour.toString().padLeft(2, '0');
      String minute =
          now.minute.toString().padLeft(2, '0'); // Pad with 0 if necessary
      String formattedTime = "$hour:$minute";
      return formattedTime;
    }

    bool isDay = DateTime.now().hour >= 5 && DateTime.now().hour < 17;
    String bgImage = isDay ? "lib/assets/1.png" : "lib/assets/2.png";

    return Scaffold(
      body: BlocProvider(
        create: (context) => context.read<WeatherBloc>(),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              context.read<WeatherBloc>().add(FetchWeather());
            }
            if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoaded) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 50, right: 7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            time,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getCurrentDate(),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                getCurrentTime(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          IconButton(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                _refresh();
                              },
                              icon: Icon(
                                Icons.replay_outlined,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          state.weathers.first.icon,
                          scale: 3,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${double.parse(state.weathers.first.degree).round()}°C',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color: Colors.white),
                            ),
                            Text(
                              state.weathers.first.description.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              state.city,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: phoneHeight / 50,
                    ),
                    Center(
                      child: SizedBox(
                        width: phoneWidth / 1.1,
                        child: Divider(),
                      ),
                    ),
                    SizedBox(
                      height: phoneHeight / 50,
                    ),
                    WeatherDetailCard(
                      weather: state.weathers.first,
                    ),
                    SizedBox(
                      height: phoneHeight / 80,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.2,
                      child: ListView.builder(
                        itemCount: state.weathers.length - 1,
                        itemBuilder: (context, index) {
                          return WeeklyWeather(
                              weather: state.weathers[index + 1]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
