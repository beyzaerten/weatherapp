class WeatherModel {
  final String day;

  final String icon;
  final String description;
  final String degree;
  final String min;
  final String max;
  final String night;
  final String humidity;

  WeatherModel({
    required this.day,
    required this.icon,
    required this.description,
    required this.degree,
    required this.min,
    required this.max,
    required this.night,
    required this.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      day: json['day'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
      degree: json['degree'] as String,
      min: json['min'] as String,
      max: json['max'] as String,
      night: json['night'] as String,
      humidity: json['humidity'] as String,
    );
  }
}
