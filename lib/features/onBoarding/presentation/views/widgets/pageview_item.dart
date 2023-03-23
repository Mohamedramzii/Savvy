import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xstore_cubit/features/onBoarding/data/models/onBoarding_model.dart';

class OnBoardingPageViewItemWidget extends StatelessWidget {
  const OnBoardingPageViewItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final OnBoardingModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            data.image,
           
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            data.title,
            style:TextStyle(fontSize: 35.sp),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            data.body,
            style: TextStyle(fontSize: 25.sp),
          ),
        )
      ],
    );
  }
}
