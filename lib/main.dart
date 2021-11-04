import 'package:flutter/material.dart';
import 'app_routing.dart';


void main() {
  runApp(
    WeatherApp(
      appRouting: AppRouting(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  final AppRouting appRouting;

  const WeatherApp({Key? key, required this.appRouting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white, displayColor: Colors.blue)),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.generateRoute,
    );
  }
}
