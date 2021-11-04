import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const SearchBar({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: searchController,
      cursorColor: AppColors.whiteColor,
      decoration:  const InputDecoration(
          hintText: "Enter a CityName .......",
          hintStyle: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
          ),
          border: InputBorder.none),
      style: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18,
      ),
    );
  }
}