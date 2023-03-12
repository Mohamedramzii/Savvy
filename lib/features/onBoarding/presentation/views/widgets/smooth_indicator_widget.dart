import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/color_manager.dart';
import '../../../data/models/onBoarding_model.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        effect: WormEffect(
          dotColor: Colors.grey,
          activeDotColor: ColorsManager.kprimaryColor,
          dotWidth: 30,
          dotHeight: 10,
          type: WormType.thin,
        ),
        count: OnBoardingModel.dummyList.length);
  }
}
