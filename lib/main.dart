import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        }),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;
  // if (condition == "Clear") {
  //   return Colors.lightGreen;
  // } else if (condition.contains("Clouds")) {
  //   return Colors.grey;
  // } else if (condition.startsWith("Rain")) {
  //   return Colors.orange;
  // } else if (condition.startsWith("Drizzle")) {
  //   return Colors.cyan;
  // } else if (condition.startsWith("Thunderstorm")) {
  //   return Colors.deepOrange;
  // } else {
  //   // Default color for all other conditions
  //   return Colors.blue;
  // }
  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Clear":
      return Colors.cyan;
    case "Partly Cloudy":
      return Colors.blueGrey;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.green;
    case "Mist":
      return Colors.lightBlue;
    case "Patchy rain nearby":
      return Colors.indigo;
    case "Patchy snow nearby":
      return Colors.lightBlue;
    case "Patchy sleet nearby":
      return Colors.purple;
    default:
      return Colors.indigo; // Default color if no condition matches
  }
}
