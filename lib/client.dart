import 'dart:convert';

import 'package:dio/dio.dart';

import 'model.dart';

class WeatherApiClient {
  Future<WeatherModel> request() async {
    String url =
        "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m,weathercode,windspeed_10m,winddirection_10m,is_day&daily=weathercode&current_weather=true&timezone=GMT&models=best_match";
    Response response = await Dio().get(url);
    final parsedData = jsonDecode(response.toString());
    final weather = WeatherModel.fromJson(parsedData);
    return weather;
  }
}
