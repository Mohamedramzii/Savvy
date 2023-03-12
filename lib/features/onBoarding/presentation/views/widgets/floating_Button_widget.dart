import 'package:flutter/material.dart';
import 'package:xstore_cubit/features/auth/presentation/views/loginview.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/networks/local/cache_helper.dart';

class OnBordingFloatingButtonWidget extends StatelessWidget {
  const OnBordingFloatingButtonWidget({
    Key? key,
    required this.isLast,
    required this.controller,
  }) : super(key: key);
  final bool isLast;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {               
          if (isLast) {
            CacheHelper.saveData(key: 'OnBoarding', value: true).then((value) {
              if (value) {
               Navigation.navigationWithoutReturn(context, screen: LoginView());
              }
            });
          } else {
            controller.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.fastLinearToSlowEaseIn);
          }
        },
        child: const Icon(Icons.arrow_forward_ios));
  }
}
