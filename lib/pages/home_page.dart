import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit/cubits/weather/weather_cubit.dart';

import 'search_page.dart';
import 'settins_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  // @override
  // void initState() {
  //   _fetchWeather();
  //   super.initState();
  // }

  // _fetchWeather() {
  //   context.read<WeatherCubit>().fetchWeather('london');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SearchPage(),
                ),
              );

              if (_city != null) {
                if (!mounted) return;
                print('city: $_city');
               context.read<WeatherCubit>().fetchWeather(_city!);
              }
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return const SettingsPage();
                },
              ));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
