import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/weather_cubit.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/data/models/daily_weather.dart';
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

  double? latitude;
  double? longitude;


  @override
  void initState() {
    super.initState();
    LocationService().getCurrentLocation().then((current) {
      latitude=current.latitude;
      longitude=current.longitude;
    });
  }



  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }




  @override
  Widget build(BuildContext context) {

    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {

        if (state is WeatherLoaded) {
          BlocProvider.of<WeatherCubit>(context).fetchDailyWeather(lat:state.weather.coord!.lat,
              lon: state.weather.coord!.lon );
        }
      },
      builder: (context, state) {
        if (state is WeatherInitial) {
          BlocProvider.of<WeatherCubit>(context).fetchDailyWeather(lat:latitude,lon: longitude );
        }
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
              },) : Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border:
                    Border.all(width: 0.2, color: AppColors.whiteColor),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  icon:  const Icon(
                      CupertinoIcons.location_solid,
                      color: AppColors.whiteColor),
                  onPressed: (){
                    BlocProvider.of<WeatherCubit>(context).fetchDailyWeather(lat:latitude,lon: longitude );
                  },
                ),
              ),
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }



  List<Widget> _buildAppBarActions(BuildContext context) {
    if (isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.search, color: AppColors.whiteColor,),
          onPressed: () {
            BlocProvider.of<WeatherCubit>(context).fetchWeatherByCity(city: _searchController.text.toLowerCase());          },
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
    return  Text(
      " " + weather.timezone!,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24),
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
