import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/weather_cubit.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/data/models/daily_weather.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/services/location_service.dart';
import 'package:weather_app/presentation/home/widgets/search_bar.dart';
import '../widgets/current_weather.dart';
import '../widgets/today_weather.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;



  @override
  void initState() {
    super.initState();
    LocationService().getCurrentLocation().then((current) {
      BlocProvider.of<WeatherCubit>(context)
          .fetchDailyWeather(
          lat: current.latitude ,
          lon:current.longitude );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is DailyWeatherLoaded) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              centerTitle: true,
              title: isSearching ? SearchBar(
                  searchController: _searchController) : _appBarTitle(
                  state.weather),
              leading: isSearching ? BackButton(
                color: AppColors.whiteColor, onPressed: () {
                _clearSearching();
                Navigator.pop(context);
              },) : const Icon(
                  CupertinoIcons.square_grid_2x2,
                  color: AppColors.whiteColor),
              actions: _buildAppBarActions(context),
            ),
            backgroundColor: AppColors.background,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CurrentWeather(
                    weather: state.weather,
                  ),
                  TodayWeather(
                    weather: state.weather,
                  ),
                ],
              ),
            ),
          );
        } else if (state is WeatherError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          );
        } else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


  List<Widget> _buildAppBarActions(context) {
    if (isSearching) {
      return [
       IconButton(
        icon: const Icon(Icons.search, color: AppColors.whiteColor,),
        onPressed: () {
        },
      ),
      ];
    } else {
      return [
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border:
              Border.all(width: 0.2, color: AppColors.whiteColor),
              borderRadius: BorderRadius.circular(30)),
          child: IconButton(
              onPressed: () {
                _startSearch();
              }, icon: const Icon(Icons.search)),
        )
      ];
    }
  }

  Widget _appBarTitle(DailyWeather weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on, color: AppColors.whiteColor),
        Text(
          " " + weather.timezone!,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30),
        )
      ],
    );
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
        LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearching();
    setState(() {
      isSearching = false;
    });
  }

  void _clearSearching() {
    setState(() {
      _searchController.clear();
    });
  }

}
