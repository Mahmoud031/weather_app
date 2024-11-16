import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

//the start point is when the user enter the city name in the search
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //this is place that can use it to provide cubit to both Home and search
    return BlocProvider(
        create: (context) => GetWeatherCubit(WeatherinitialState()),
        child: Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                    useMaterial3: false,
                    primarySwatch: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition)),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        }));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  if (['Sunny', 'Clear'].contains(condition)) {
    return Colors.orange;
  } else if (['Partly cloudy', 'Mist', 'Fog', 'Freezing fog']
      .contains(condition)) {
    return Colors.blueGrey;
  } else if (['Cloudy', 'Overcast'].contains(condition)) {
    return Colors.grey;
  } else if ([
    'Patchy rain possible',
    'Light drizzle',
    'Patchy light rain',
    'Light rain',
    'Light rain shower'
  ].contains(condition)) {
    return Colors.lightBlue;
  } else if ([
    'Moderate rain',
    'Heavy rain',
    'Torrential rain shower',
    'Moderate or heavy rain with thunder'
  ].contains(condition)) {
    return Colors.blue;
  } else if ([
    'Patchy snow possible',
    'Light snow',
    'Patchy light snow',
    'Light snow showers'
  ].contains(condition)) {
    return Colors.lightBlue;
  } else if ([
    'Moderate snow',
    'Heavy snow',
    'Blizzard',
    'Moderate or heavy snow with thunder'
  ].contains(condition)) {
    return Colors.blue;
  } else if (['Patchy sleet possible', 'Light sleet', 'Light sleet showers']
      .contains(condition)) {
    return Colors.blueGrey;
  } else if ([
    'Patchy freezing drizzle possible',
    'Freezing drizzle',
    'Heavy freezing drizzle',
    'Light freezing rain',
    'Moderate or heavy freezing rain'
  ].contains(condition)) {
    return Colors.cyan;
  } else if ([
    'Thundery outbreaks possible',
    'Patchy light rain with thunder',
    'Patchy light snow with thunder'
  ].contains(condition)) {
    return Colors.purple;
  } else if ([
    'Ice pellets',
    'Light showers of ice pellets',
    'Moderate or heavy showers of ice pellets'
  ].contains(condition)) {
    return Colors.indigo;
  } else {
    return Colors.blue; // Default color for unknown conditions
  }
}
