import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/no_weather.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        //the widget that listen to the Cubit
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherinitialState) {
              return  const NoWeather();
            } else if (state is WeatherLoadedState) {
              return const WeatherInfoBody();
            } else {
              return const Text("oops there was an error");
            }
          },
        ));
  }
}
