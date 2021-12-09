import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/business_logic/weather_cubit.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/data/services/location_service.dart';
import 'package:weather_app/presentation/home/widgets/app_bar_actions.dart';
import 'package:weather_app/presentation/home/widgets/appbar_title.dart';
import 'package:weather_app/presentation/home/widgets/empty_circle.dart';
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
 late Position currentLocation;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

 Future<void> getCurrentLocation()async{
   currentLocation=await LocationService.getCurrentLocation().whenComplete((){
     setState(() {});
   });
   BlocProvider.of<WeatherCubit>(context).fetchDailyWeather(lat: currentLocation.latitude, lon: currentLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoaded) {
          BlocProvider.of<WeatherCubit>(context).fetchDailyWeather(
            lat: state.weather.coord!.lat,
            lon: state.weather.coord!.lon,
          );
        }
      },
      builder: (context, state) {
        if (state is DailyWeatherLoaded) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              centerTitle: true,
              title: isSearching
                  ? SearchBar(searchController: _searchController)
                  : AppBarTitle(weather: state.weather),
              leading: isSearching
                  ? BackButton(
                      color: AppColors.whiteColor,
                      onPressed: () {
                        _clearSearching();
                        Navigator.pop(context);
                      },
                    )
                  : EmptyCircle(
                      widget: IconButton(
                        icon: const Icon(CupertinoIcons.location_solid,
                            color: AppColors.whiteColor),
                        onPressed: () {
                          BlocProvider.of<WeatherCubit>(context).fetchDailyWeather
                            (lat: currentLocation.latitude, lon: currentLocation.longitude);
                        },
                      ),
                    ),
              actions: [
                AppBarActions(
                    isSearching: isSearching,
                    searchController: _searchController,
                    startSearch: _startSearch,
                ),
              ],
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
              style:   const TextStyle(color: Colors.white, fontSize: 30),
            ),
          );
        } else if(state is WeatherLoading){
          return  const Center(child:  CircularProgressIndicator(),);
        }else {
          return Container();
        }
      },
    );
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
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
