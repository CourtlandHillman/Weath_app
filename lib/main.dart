import 'package:flutter/material.dart';
import 'package:weath_app/model.dart';

import 'client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeathApp(),
    );
  }
}

class WeathApp extends StatefulWidget {
  WeathApp({super.key});

  @override
  State<WeathApp> createState() => _WeathAppState();
}

class _WeathAppState extends State<WeathApp> {
  WeatherModel? weather;
  List<dynamic>? hourly_temp;
  List<dynamic>? hourly_date;
  List<dynamic>? hourly_wind;
  List<Widget>? hourly_cast;
  List<Widget>? hourly_cast_date;
  List<Widget>? hourly_cast_wind;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(117, 1, 34, 13),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "CurrentWeather",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.sunny,
                color: Colors.amber,
                size: 64.0,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${weather?.currentWeather["temperature"] ?? 0}°C",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  //print("Test");
                  weather = await WeatherApiClient().request();
                  print(weather?.currentWeather);
                  hourly_temp = weather?.hourly["temperature_2m"];
                  hourly_date = weather?.hourly["time"];
                  hourly_wind = weather?.hourly["windspeed"];
                  hourly_cast = hourly_temp
                      ?.map(
                        (e) => Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "$e°C",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                      .toList();

                  // hourly_cast_wind = hourly_wind
                  //     ?.map(
                  //       (e) => Padding(
                  //         padding: EdgeInsets.all(8.0),
                  //         child: Text(
                  //           "$e",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 10,
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //     .toList();

                  hourly_cast_date = hourly_date
                      ?.map(
                        (e) => Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "$e",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                      .toList();

                  setState(() {});
                },
                child: Text("Get Weather Info"),
              ),
              Container(
                margin: EdgeInsets.all(22),
                color: Color(0xFF313131),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: hourly_cast_date == null
                          ? [Text("Empty")]
                          : hourly_cast_date!,
                    ),
                    // Column(
                    //   children: hourly_cast_wind == null
                    //       ? [Text("Empty")]
                    //       : hourly_cast_wind!,
                    // ),
                    Column(
                      children:
                          hourly_cast == null 
                          ? [Text("Empty")] 
                          : hourly_cast!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
