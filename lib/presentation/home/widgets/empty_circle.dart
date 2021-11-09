import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';

class EmptyCircle extends StatelessWidget {
  final Widget widget;
  const EmptyCircle({Key? key,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border:
          Border.all(width: 0.2, color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(30)),
      child: widget,
    );
  }
}
