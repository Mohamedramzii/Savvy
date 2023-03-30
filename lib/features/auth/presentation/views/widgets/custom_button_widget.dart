import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_managers/color_manager.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.text,
     this.color,
    required this.onpressed,
  }) : super(key: key);
  final String text;
  final Color? color;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? ColorsManager.kprimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
