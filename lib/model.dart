class WeatherModel {
  WeatherModel({required this.currentWeather, required this.hourly});

  final hourly;
  final currentWeather;

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    final currentWeather = data["current_weather"] as Map<String, dynamic>;
    final hourly = data["hourly"] as Map<String, dynamic>;
    return WeatherModel(currentWeather: currentWeather, hourly: hourly);
  }
}

class CurrentWeather {
  CurrentWeather({
    required this.temperature,
    required this.windspeed,
    required this.weathercode,
    required this.winddirection,
    required this.is_day,
  });

  final double temperature;
  final double windspeed;
  final double winddirection;
  final int weathercode;
  final int is_day;

  factory CurrentWeather.fromJson(Map<String, dynamic> data) {
    final temperature = data["temperature"] as double;
    final windspeed = data["windspeed"] as double;
    final winddirection = data["winddirection"] as double;
    final weathercode = data["weathercode"] as int;
    final is_day = data["is_day"] as int;
    return CurrentWeather(
        temperature: temperature,
        windspeed: windspeed,
        weathercode: weathercode,
        winddirection: winddirection,
        is_day: is_day);
  }
}

class HourlyCass {
  HourlyCass({required this.time, required this.temperature});

  final List<String> time;
  final List<double> temperature;
  factory HourlyCass.fromJson(Map<String, dynamic> data) {
    final List<String> time = data["time"] as List<String>;
    final List<double> temperature = data["temperature"] as List<double>;
    return HourlyCass(
      time: time, 
      temperature: temperature);
  }
}
