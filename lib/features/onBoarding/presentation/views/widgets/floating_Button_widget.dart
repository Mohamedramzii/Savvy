import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_managers/app_router.dart';

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
                          GoRouter.of(context)
                              .pushReplacement(Routes.loginview);
                        } else {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.easeInCirc);
                        }
                      },
                      child: const Icon(Icons.arrow_forward_ios));
  }
}
