import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            controller: searchController,
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.green,
                ),
              ),
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon: IconButton(
                  onPressed: () {
                    var getWeatherCubit =
                        BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName: searchController.text);
                    print(searchController.text);
                    searchController.clear();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
