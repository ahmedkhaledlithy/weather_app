import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/weather_cubit.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/presentation/home/widgets/empty_circle.dart';

class AppBarActions extends StatelessWidget {
 final bool isSearching;
 final TextEditingController searchController;
 final VoidCallback? startSearch;
  const AppBarActions({Key? key,required this.isSearching,required this.searchController,required this.startSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSearching? IconButton(
      icon: const Icon(Icons.search, color: AppColors.whiteColor,),
      onPressed: () {
        BlocProvider.of<WeatherCubit>(context).fetchWeatherByCity(city: searchController.text.toLowerCase());
        },
    ): EmptyCircle(widget: IconButton(
        onPressed: () {
          startSearch!();
        }, icon: const Icon(Icons.search)));
  }
}
